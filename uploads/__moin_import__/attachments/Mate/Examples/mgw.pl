#!/usr/bin/perl
# (c) 2004 Luis Ontanon
# distributed on the same terms of ethereal itself
#
# This script will create a transformation list needed for mapping DPC:OPC:CIC to MGC_TERM
# on Ericsson's ViG (I suppose it works with IPT's MG/MGC as well)
# usage:
# perl mgw.pl mgc_dpc mgw_port peer_dpc cic_base [mgw_port peer_dpc cic_base [...]]

$mydpc = shift;

while (1) {

	$port = shift;
	$dpc = shift;
	$base = shift;

	last unless defined $port and defined $dpc and defined $base;

	for ($cic = $base; $cic < $base + 31; $cic++) {
		$ts = $cic % 32;
		print "Action=Transform; Name=mgw_mgc.$mydpc.; Match=Strict; Mode=Insert; mtp3pc=$mydpc;  mtp3pc=$dpc; cic=$cic; .term=DS1/$port/$ts;\n";
		print "Action=Transform; Name=mgc.$mydpc._mgw; Match=Strict; Mode=Insert; term=DS1/$port/$ts; .mtp3pc=$mydpc; .mtp3pc=$dpc; .cic=$cic;\n";
	}
} 
