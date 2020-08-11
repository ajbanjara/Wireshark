#!/usr/bin/perl
# vig_splitter, Luis.Ontanon.IBM@h3g.it 07/2004
# splitts a vig caputure session into several ones
# each containing the packets of a single call
#
# usage: vig_splitter in_file.cap 'filter'
#
# Features missing:
# - reporting: start, end, release cause, number of h245 commands, etc...
# - filter: a-number or b-number based filtering 
# - duplicates out (checking the payload of consecutive packets)
# - live capture (check for leaks)
# - configuration file
# - only signalling flag
# - RTSP
#
# Known bugs:
# - packets for a call coming after all RLCs are lost
#
# To Do:
# - (re)write decoders as NetPacket modules
#    NetPacket::SCTP
#    NetPacket::M3UA
#    NetPacket::MTP3
#    NetPacket::ISUP
#    NetPacket::Q931
#    NetPacket::MEGACO
#

use strict;
use Net::Pcap;
use NetPacket::Ethernet qw(:strip) ;
use NetPacket::IP qw(:strip);
use NetPacket::UDP qw(:strip);
use NetPacket::TCP qw(:strip);

$| = 1;
# Am I debugging this code (the bigger the value the most junk you get!)
my $DEBUG = 0;

# dpc of the mgc
my $MGC_DPC = 6017;

# spans defined in mgc/mg
my %MGC_DS1 = %{ {
	5378 => {
		0 => '0/1',
		32 => '1/1'
	},
	11522 => {
		0 => '1/2',
		32 => '3/1'
	} } };
			

my $a;
my $a_number = undef;
my $b_number = undef;
my $dups_out = 0;
my $in_file = undef;
while ($a = shift) {
	if ($a eq '-a') {
		$a_number = shift;
	} elsif ($a eq '-b') {
		$b_number = shift;
	} elsif ($a eq '-d') {
		$dups_out = 1;
	} elsif (not defined $in_file && -f $a) {
		$in_file = $a;
	} else {
		die "usage: vig_split [-a filter] [-b filter] [-d] in_file.cap"
	}
}


my %ISUP;
my %isup;
my %isup_opt;
init_hashes();

my %calls = ();  
my %cics = ();
my %ctxs = ();
my %trxs = ();
my %ds1s = ();
my %id2ds1 = ();
my %call2ds1 = ();
my %cr =();
my %rtp = ();
my %ctx_rtp = ();

my ($err, $pcap_in, $pcap_out, $pcap_t, $pkt, $i);

$i = 0 ;
$pcap_in = Net::Pcap::open_offline($in_file, \$err);

while (1) {
	$i++;
	my %h = ();
	my $pkt = Net::Pcap::next($pcap_in, \%h);
	last unless defined $pkt;
	
	# backup paket data for dumping it later
	my %H = %h; my $PKT = $pkt;

	decode_packet(\%h,$pkt);

	if ($h{ip_proto} == 0x11 ) { # udp for rtp
		my $id = undef;

		print " $i: RTP $h{ip_src_ip}:$h{src_port} > $h{ip_dest_ip}:$h{dest_port}\n" if $DEBUG;
		if ( exists $rtp{"$h{ip_src_ip}:$h{src_port}"} ) {
			$id = $rtp{"$h{ip_src_ip}:$h{src_port}"};
		} elsif ( exists $rtp{"$h{ip_dest_ip}:$h{dest_port}"} ) {
			$id = $rtp{"$h{ip_dest_ip}:$h{dest_port}"};
		}

		next unless exists $calls{$id};
		Net::Pcap::dump(${$calls{$id}}{pcap},\%H,$PKT);
		     
	} elsif (exists $h{call_ref}) { # h323 

		if ($h{msg_type} == 5) { # SETUP
			next if defined $a_number and $h{caller} != $a_number;
			next if defined $b_number and $h{called} != $b_number;
	
			my $id = "$h{caller}-$h{called}";

			unless ($id =~ /^\d+-\d+$/) {
				print " $i: Q931 SETUP $h{call_ref} botched: $id\n" if $DEBUG;
				next;
			}
			print " $i: Q931 SETUP $h{call_ref} belongs to '$id'\n" if $DEBUG;

			unless ( exists $calls{$id} ) {
				my $filename = "$h{tv_sec}-$id.cap";
				${$calls{$id}}{pcap} = Net::Pcap::dump_open($pcap_in, $filename);
				print " $i: started call $id into $filename\n" if $DEBUG;
			} 

			${${$calls{$id}}{q931}}{$h{call_ref}} = '';
			$cr{$h{call_ref}} = $id;
			Net::Pcap::dump(${$calls{$id}}{pcap},\%H,$PKT);
		} elsif ($h{msg_type} == 0x5a) { # RLC
			my $id = $cr{$h{call_ref}};
			print " $i: Q931 RLC $h{call_ref} belongs to '$id'\n" if $DEBUG;
			next unless exists $calls{$id};
			Net::Pcap::dump(${$calls{$id}}{pcap},\%H,$PKT);
			delete $cr{$h{call_ref}};
			delete ${${$calls{$id}}{q931}}{$h{call_ref}};
			
			# close if last leg of call
			close_on_last($id);
			
		} elsif ( exists $cr{$h{call_ref}} ) {
			my $id = $cr{$h{call_ref}};
			print " $i: Q931($h{msg_type}) $h{call_ref} belongs to '$id'\n" if $DEBUG;
			next unless exists $calls{$id};
			Net::Pcap::dump(${$calls{$id}}{pcap},\%H,$PKT);
		}

	} elsif (exists $h{trx_id}) { # MeGaCo

		if ($DEBUG) {
			my $b = '';
			/term_DS1|command_DS1/ and $b .= "$_ = '$h{$_}'  " for (keys %h);
			print " $i: h248 $h{ctx} $b\n" if $DEBUG;
		}

		if ($h{ctx} == '$') { # create context
			my $ds1 = undef;
			for my $d (keys %ds1s) {
				if (exists $h{"term_$d"}) {
					$ds1 = $d;
					last;
				}
			}
			my $id =  $ds1s{$ds1};
			$trxs{$h{trx_id}} = $id;
			delete $ds1s{$ds1};
			
			next unless exists $calls{$id};
			print " $i: h248 'create' belongs to $id\n" if $DEBUG;
			Net::Pcap::dump(${$calls{$id}}{pcap},\%H,$PKT);
		} elsif (exists $trxs{$h{trx_id}}) { # reply to create has ctx_id
			my $id =  $trxs{$h{trx_id}};
			next unless exists $calls{$id};
			Net::Pcap::dump(${$calls{$id}}{pcap},\%H,$PKT);
			my $ctx = $h{ctx};
			$ctxs{$ctx} = $id;
			delete $trxs{$h{trx_id}};
			# RTP stuff here
			my $rtpid = "$h{mg_rtp_addr}:$h{mg_rtp_port}";
			$rtp{$rtpid} = $id;
			$ctx_rtp{$ctx} = $rtpid;
			print " $i: h248 'create reply' for $h{trx_id} belongs to $id rtp: $rtpid\n" if $DEBUG;
		} elsif (exists $ctxs{$h{ctx}} ) { # all other defined contexts has to be dumped
			my $id = $ctxs{$h{ctx}};
			next unless exists $calls{$id};
			Net::Pcap::dump(${$calls{$id}}{pcap},\%H,$PKT);
			if ( $h{trx_type} eq 'Reply' and $h{'command_*'} eq 'Subtract') {
				print " $i: h248 last packet of context $h{ctx}\n" if $DEBUG;
				delete $ctxs{$h{ctx}};
				delete $id2ds1{$id};
				my $rtpid = $ctx_rtp{$h{ctx}};
				delete $rtp{$rtpid};
				delete $ctx_rtp{$h{ctx}};
			}
		}
	} elsif (exists $h{isup_cic}) { # isup
		my $dpc = $MGC_DPC == $h{mtp3_opc} ? $h{mtp3_dpc} : $h{mtp3_opc};
		my $cic = "$dpc:$h{isup_cic}";
		my $id = exists $cics{$cic} ? $cics{$cic} : undef;
		if ( $h{isup_type} == 1 ) {
                        next if defined $a_number and $h{caller} != $a_number;
                        next if defined $b_number and $h{called} != $b_number;

			my ($caller, $called) = @h{'caller','called'};
			$called =~ s/F$//;
			my $ts = $h{tv_sec};
			my $filename = "$ts-$caller-$called.cap";
			my $id = "$caller-$called";
			my $ds1 = cic2ds1($cic);
			print " $i: IAM($cic $ds1): belongs to $id\n" if $DEBUG;

			unless ( exists $calls{$id} ) {
	                        my $ts = $h{tv_sec};
	                        my $filename = "$ts-$caller-$called.cap";
				print " $i: IAM call '$id' doesn't exists already opening file\n" if $DEBUG;
				${$calls{$id}}{pcap} = Net::Pcap::dump_open($pcap_in, $filename);
			}
			${$calls{$id}}{isup} = $cic;
			$ds1s{$ds1} = $id;
			$id2ds1{$id} = $ds1;
			$cics{$cic} = $id;

			Net::Pcap::dump(${$calls{$id}}{pcap},\%H,$PKT);
		} elsif ( $h{isup_type} == 16 ) {
			print " $i: RLC $h{isup_cic}\n" if $DEBUG;
			next unless exists $calls{$id};
			Net::Pcap::dump(${$calls{$id}}{pcap},\%H,$PKT);
			# close if last leg
			delete ${$calls{$id}}{isup};
			close_on_last($id);
		} else {
			print " $i: ISUP $h{isup_type} $h{isup_cic}\n" if $DEBUG;
			next unless exists $calls{$id};
			my $d = Net::Pcap::dump(${$calls{$id}}{pcap},\%H,$PKT);
		}
	}
}

Net::Pcap::close($pcap_in);

exit;

sub close_on_last {
	my $id = shift;
	my $n = 0;
	$n++ for (keys %{${$calls{$id}}{q931}});
	$n++ if (exists ${$calls{$id}}{isup});
	print "  $i: close_on_last for '$id' has $n legs left\n" if $DEBUG;
	if ($n == 0) {
		Net::Pcap::dump_close(${$calls{$id}}{pcap});
		delete $calls{$id};
	}
}

sub cic2ds1 {
	my $id = shift;
	my ($dpc,$cic) = split /:/, $id;
	my $t = $cic % 32;
	my $d = $cic - $t;
	
	return "DS1/${$MGC_DS1{$dpc}}{$d}/$t";
}

sub decode_packet {
	my $h = shift;
	my $pkt = shift;

        ##### Decode the packet into %h
        my $ip = NetPacket::IP->decode(eth_strip($pkt));
        ${$h}{"ip_$_"} = ${$ip}{$_} for (keys %{$ip});

        if ( ${$h}{ip_proto} == 0x84 ) { # SCTP

                # SCTP Header
                @{$h}{'sctp_src_port', 'sctp_dst_port', 'sctp_verif', 'chksum','junk'}
                        = unpack "nnNN*",${$h}{ip_data};
                delete ${$h}{junk};

                my $left = ${$h}{ip_data};
                $left =~ s/^.{12}//ms;

                my %s = parse_sctp_chunks($left);
                ${$h}{$_} = $s{$_} for (keys %s);

        } elsif ( ${$h}{ip_proto} == 0x06) {
                my $tcp = NetPacket::TCP->decode(ip_strip(eth_strip($pkt)));
                ${$h}{$_} = ${$tcp}{$_} for (keys %{$tcp});

                if (${$h}{dest_port} == 1720 or ${$h}{src_port} == 1720 or ${$h}{dest_port} == 1721 or ${$h}{src_port} == 1721) { # H323
                        my %q = parse_h323_message(${$h}{data});
                        ${$h}{$_} = $q{$_} for (keys %q);
                }
        } elsif ( ${$h}{ip_proto} == 0x11 ) {
		my $udp = NetPacket::UDP->decode(ip_strip(eth_strip($pkt)));
		${$h}{$_} = ${$udp}{$_} for (keys %{$udp});
        }

}

sub parse_h323_message {
	$_ = $_[0];
	my %q = ();
	#print "   h323($i): " . bin2hex($_) . "\n";
	
	my ($tver,$tres,$tlen,$proto,$crlen,$call_ref,$msg_type) = unpack "CCnCCnC",$_;
	return () if $tver ne 3;
	$call_ref -= 32768 if $call_ref > 32768;
	print " h323($i): vers: $tver len: $tlen proto: $proto call_ref: $call_ref msg_type: $msg_type\n" if $DEBUG > 2;
	printf " h323($i): call ref = %0.2X\n",$call_ref if $DEBUG > 2;
	@q{'call_ref','msg_type'} = ($call_ref,$msg_type);

	my $b = $_;
	$b =~ s/^.{9}//ms;
	if ($msg_type == 5 ) { # q931 SETUP
                while(1) {
                        $b =~ s/^(..)//ms or last;
                        my ($t,$l) = unpack "CC", $1;
                        $b =~ s/^(.{$l})//ms;
                        my $data = $1;
                        print "   h323($i): option: $t len: $l data: " . bin2hex($data) . "\n" if $DEBUG > 2;
	
                        if ($t == 0x6c ) { # calling party
                                $data  =~ s/^(..)//ms;
				print " h323($i): calling number: $data\n" if $DEBUG > 2;
				$q{caller} = $data;
                        } elsif ($t == 0x70) { # called party
				$data  =~ s/^(.)//ms;
                                print " h323($i): called number: $data\n" if $DEBUG > 2;
				$q{called} = $data;
			} elsif ($t == 0x74) {
				$data  =~ s/^(..)//ms;
				print " h323($i): redirecting number: $data\n" if $DEBUG > 2;
				$q{redirecting} = $data;
			}
			
                }
	}

	return %q;
}


sub parse_sctp_chunks {
	my $b = shift;
	my %c = ();

	my $len = (length $b) - 14;
	my ($t,$f,$l,$tsn,$s,$n,$p,$j) = unpack "ccnNnnN*",$b;
	print "  sctp $t $p\n" if $DEBUG > 2;
	
	@c{'sctp_type','sctp_proto'} = ($t,$p);

	my  $len = $l - 16;
	$b =~ s/^.{16}(.{$len})//ms or die "no match";
	$c{msg} = $1;

	if ( $t != 0 ) {
		return undef;
	} elsif ($p == 7) { # MEGACO
		my %m = parse_megaco($c{msg});
		$c{$_} = $m{$_} for (keys %m);
	} elsif ($p == 3) { # M3UA (isup)
		my %i = parse_isup($c{msg});
		$c{$_} = $i{$_} for (keys %i);
	}

	return %c;
}

sub parse_megaco {
	$_ = $_[0];
	my %m = ();

	s/\n/ /g;
	s/(\s)+/ /g;

	my $d = $_[0];
	$d =~ s/\n/\n megaco($i)\|\t/gms;
	print $d if $DEBUG > 5;
	
	@m{'trx_type','trx_id'} = ($1,$2) if s/(Transaction|Reply)\s+=\s+([0-9]+)[^{]*\{(.*)\}/$3/msi;

	$m{ctx} = $1 if s/Context\s+=\s+([0-9]+|\$)[^{]*\{(.*)\}/,$2/;
	print " megaco($i): @m{'trx_type','trx_id'}  ctx = $m{ctx}\n" if $DEBUG > 2;

	$_ .= ',';

	s/(Modify|Notify|Add|Substract)/#$1#/gms;


	while (s@#(Modify|Notify|Add|Substract)#.*?=.*?((RTP|MUX|DS1)/([0-9/]+|\$|\*))([^#]*)@@msi) {
		my ($cmd,$term,$param,$type) = ($1,$2,$5,$3);	
		my $c = "command_$term";
		my $t = "term_$term";
		my $p = "param_$term";

		next unless defined $cmd;
		print "megaco($i): term $c: '$cmd' $t: '$term'\nmegaco($i) param($term): $param\n" if $DEBUG > 2;
		@m{$c,$t,$p} = ($cmd,$term,$param);
		
		if ($type == 'RTP' and $param =~ /c=IN IP4 ([0-9.]+).*m=audio (\d+).*a=rtpmap:(\d+ \S+)/ ) {
			@m{'mg_rtp_addr','mg_rtp_port','mg_rtp_media'} = ($1,$2,$3);
			print "megaco($i): RTP: @m{'mgc_rtp_addr','mgc_rtp_port','mgc_rtp_media'}\n" if $DEBUG > 2;
		}
			
	}

	return %m;
	
}

sub init_hashes {
	%isup = %{{
		1 => 'IAM',
		6 => 'ACM',
		9 => 'ANM',
		12 => 'REL',
		16 => 'RLC'
	}};
	
	%ISUP = %{{
		IAM => 1,
		ACM => 6,
		ANM => 9,
		REL => 12,
		RLC => 16
	}};

	%isup_opt = %{{
		10 => 'caller',
		11 => 'redirecting',
		40 => 'original',
		63 => 'location'
	}};
}

sub parse_isup {
	my $b = shift;
	print "\tisup($i): " . bin2hex($b) . "\n" if $DEBUG > 2;
	my ($v,$r,$c,$t,$l1,$d,$l2,$sio,$rl,$cic,$cic2,$type)
		= unpack "CCCCNnnCVCCC", $b;
	$cic = 256 * $cic2 + $cic;
	$b =~ s/^.{20}//ms;
	my $sls = ($rl & 0xf0000000) >> 18;
	my $opc = ($rl & 0x0fffc000) >> 14;
	my $dpc = ($rl & 0x00003fff);
	printf "   isup($i): $opc -> $dpc: $isup{$type} cic: $cic\n" if $DEBUG > 2;
	
	my %i = ();
	@i{'m3ua_version','m3ua_class','m3ua_type'} = ($v,$c,$t);
	@i{'mtp3_sio','mtp3_opc','mtp3_dpc','mtp3_sls'} = ($sio, $opc, $dpc, $sls);
	@i{'isup_cic','isup_type'} = ($cic,$type);
	
	if( $type == 1 ) { # IAM
		my ($nci,$fci,$ac,$medium,$ptr,$opt_ptr,$len,$f1,$f2) = unpack "cnccccccc", $b;		
		$i{isup_medium} = $medium;
		
		#print "isup before: " . bin2hex($b) . "\n" if $DEBUG > 2;
		$b =~ s/^.{10}//ms;
		
		my $called = '';
		
		$len -= 2;
		while($len--) {
			$b =~ s/^(.)//ms;
			my $h = sprintf '%0.2X',unpack 'C',$1;
			$h =~ s/(.)(.)/$2$1/;
			$called .= $h;
		}
		$called =~ s/0$//;
		print "   isup($i): called number: $called\n" if $DEBUG > 2;
		$i{called} = $called;

		#print "isup before options:" . bin2hex($b) . "\n" if $DEBUG > 2;
		
		
                while(1) {
                        $b =~ s/^(..)//ms or last;
			my ($t,$l) = unpack "CC", $1;
			$b =~ s/^(.{$l})//ms;
			my $data = $1;
			print "   isup($i): option: $t len: $l data: " . bin2hex($data) . "\n" if $DEBUG > 2;
			if ($t == 10 || $t == 11 || $t == 40 || $t == 63) { # calling party
				$data  =~ s/^(..)//ms;
				$l -= 2;
				my $number = '';
				while ($l--) {
		                        $data =~ s/^(.)//ms;
					my $h = sprintf '%0.2X',unpack 'C',$1;
		                        $h =~ s/(.)(.)/$2$1/;
					$number .= $h;
				}

				print "   isup($i): $isup_opt{$t} number: $number\n" if $DEBUG > 2;
				$i{$isup_opt{$t}} = $number;
			}
                }

		
	}

	return %i;
}

sub bin2hex {
	my $b = '';
	for my $a (@_) {
		for my $c (split //ms, $a) {
		$b .= sprintf ("%.2X:",unpack 'C', $c);
		}
	}
	$b =~ s/:$//;
	return $b;
}


