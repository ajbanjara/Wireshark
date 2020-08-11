#!/usr/bin/env ruby

# Copyright 2015 Dario Lombardo <lomato[at]gmail.com>
#
# Wireshark - Network traffic analyzer
# By Gerald Combs <gerald@wireshark.org>
# Copyright 1998 Gerald Combs
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

# Based on extcap_example.py by Ronald Knall

# This is a generic example, which produces pcap packages every n seconds, and
# is configurable via extcap options.
#
# To use this script on Windows, please generate an extcap_example.bat inside
# the extcap folder, with the following content:
#
# -------
# @echo off
# <Path to ruby interpreter> <Path to script file> %*
# -------
#
# Windows is not able to execute Ruby scripts directly, which also goes for all
# other script-based formates beside VBScript

require 'optparse'
require 'ostruct'
require 'pp'

Version = [0, 0, 1]

$doExit = false
globalinterface = 0

def usage
	"Usage: #{$0} <--extcap-interfaces | --extcap-dlts | --extcap-" +
		"interface | --extcap-config | --capture | --extcap-capture-filter | --fifo>\n"
end

class OptParse
	def self.parse(args)
		# The options specified on the command line will be collected in *options*.
		# We set default values here.
		options = OpenStruct.new
		options.library = []
		options.inplace = false
		options.encoding = "utf8"
		options.transfer_type = :auto
		options.verbose = false
		options.remote = "if1"
		options.delay = 5
		options.message = "Extcap Test"
		options.verify = false

		opt_parser = OptionParser.new do |opts|
			opts.banner = usage()

			opts.on("--capture", "Start the capture routine") do |c|
				options[:capture] = c
			end

			opts.on("--extcap-interfaces", "Provide a list of interfaces to capture from") do |ei|
				options[:extcap_interfaces] = ei
			end

			opts.on("--extcap-interface IF", String, "Provide the interface to capture from") do |ei|
				options[:extcap_interface] = ei
			end

			opts.on("--extcap-dlts", "Provide a list of dlts for the given interface") do |dlts|
				options[:extcap_dlts] = dlts
			end

			opts.on("--extcap-config", "Provide a list of configurations for the given interface") do |config|
				options[:extcap_config] = config
			end

			opts.on("--extcap-capture-filter FILTER", String, "Used together with capture "
					"to provide a capture filter") do |filter|
				options[:extcap_capture_filter] = filter
			end

			opts.on("--fifo FILE", String, "Use together with capture to provide the fifo"
					" to dump data to") do |fifo|
				options[:fifo] = fifo
			end

			opts.on("--verify", "Demonstrates a verification bool flag") do |v|
				options[:verify] = v
			end

			opts.on("--delay DELAY", Integer, "Demonstrates an integer variable") do |delay|
				options[:delay] = delay
			end

			opts.on("--remote IF", ["if1", "if2"], "Demonstrates a selector choice") do |remote|
				options[:remote] = remote
			end

			opts.on("--message MESSAGE", String, "Demonstrates string variabl") do |message|
				options[:message] = message
			end

			# No argument, shows at tail.  This will print an options summary.
			# Try it and see!
			opts.on_tail("-h", "--help", "Show this message") do
				puts opts
				exit
			end

			# Another typical switch to print the version.
			opts.on_tail("--version", "Show version") do
				puts ::Version.join('.')
				exit
			end
		end
		opt_parser.parse!(args)

		if !options[:extcap_interfaces] && !options[:extcap_interface]
			puts "An interface must be provided or the selection must be displayed"
			exit 1
		end

	    options
	end
end

def extcap_interfaces
	puts "interface {value=example1}{display=Example interface usage for extcap}"
end

def extcap_dlts(interface)
	if interface == '1'
		puts "dlt {number=147}{name=USER0}{display=Demo Implementation for Extcap}"
	end
end

def extcap_config(interface)
	args = []
	values = []

	args << [0, '--delay', 'Time delay', 'Time delay between packages', 'integer', '{range=1,15}']
	args << [1, '--message', 'Message', 'Package message content', 'string', '']
	args << [2, '--verify', 'Verify', 'Verify package content', 'boolflag', '']
	args << [3, '--remote', 'Remote Channel', 'Remote Channel Selector', 'selector', '']

	values << [3, "if1", "Remote1", "true"]
	values << [3, "if2", "Remote2", "false"]

	args.each do |arg|
		printf "arg {number=%d}{call=%s}{display=%s}{tooltip=%s}{type=%s}%s\n" % arg
	end

	values.each do |value|
		printf "value {arg=%d}{value=%s}{display=%s}{default=%s}\n" % value
	end
end

def unsigned(n)
	return Integer(n) & 0xFFFFFFFF
end

def pcap_fake_header
	header = ""
	header << [Integer('a1b2c3d4', 16)].pack('<L')
	header << [unsigned(2)].pack('<S_') # Pcap Major Version
	header << [unsigned(4)].pack('<S_') # Pcap Minor Version
	header << [Integer(0)].pack('<I') # Timezone
	header << [Integer(0)].pack('<I') # Accuracy of timestamps
	header << [Integer('0000ffff', 16)].pack('<L') # Max Length of capture frame
	header << [unsigned(1)].pack('<L') # Ethernet
	header
end

def pcap_fake_package(message)
	pcap = ""

	caplength = message.size + 14 + 20
	timestamp = Time.now.to_i

	pcap << [unsigned(timestamp)].pack('<L') # timestamp seconds
	pcap << [0x00].pack('<L') # timestamp nanoseconds
	pcap << [unsigned(caplength)].pack('<L') # length captured
	pcap << [unsigned(caplength)].pack('<L') # length in frame

	# ETH
	pcap << [0x00].pack('s_') # source mac
	pcap << [0x00].pack('s_') # source mac
	pcap << [0x00].pack('s_') # source mac
	pcap << [0x00].pack('s_') # dest mac
	pcap << [0x00].pack('s_') # dest mac
	pcap << [0x00].pack('s_') # dest mac
	pcap << [unsigned(8)].pack('<s_') # protocol (ip)

	# IP
	pcap << [Integer('45', 16)].pack('c') # IP version
	pcap << [Integer('0', 16)].pack('c')
	pcap << [unsigned(message.size + 20)].pack('n') # length of data + payload
	pcap << [Integer('0', 16)].pack('<S_') # Identification
	pcap << [Integer('40', 16)].pack('c') # Don't fragment
	pcap << [Integer('0', 16)].pack('c') # Fragment offset
	pcap << [Integer('40', 16)].pack('c')
	pcap << [0xFE].pack('C') # Protocol (2 = unspecified)
	pcap << [Integer('0000', 16)].pack('<S_') # Checksum
	pcap << [Integer('7F000001', 16)].pack('N') # Source IP
	pcap << [Integer('7F000001', 16)].pack('N') # Dest IP

	pcap << message
	pcap
end

def extcap_capture(interface, fifo, delay, verify, message, remote)
	Signal.trap('INT') { signalHandler }
	Signal.trap('TERM') { signalHandler }

	tdelay = ((delay && delay > 0) ? delay : 5)

	fh = File.open(fifo, "wb")
	puts "Opening #{fifo}"
	fh.write(pcap_fake_header)

	while $doExit == false
		out = "%s|%04X%s|%s" % [remote.chomp, message.size, message, verify]
		begin
			fh.write(pcap_fake_package(out))
			sleep(tdelay)
		rescue => e
			$doExit = true
		end
	end

	fh.close
end

# MAIN
begin
	# Capture options
	delay = 0

	options = OptParse.parse(ARGV)

	if options[:extcap_interfaces] || !options[:extcap_interface]
		extcap_interfaces
		exit 0
	end

	m = options[:extcap_interface].scan(/example(\d+)/)
	if m.size == 0
		exit 1
	end
	interface = m[0][0]

	verify = options[:verify] ? "True" : "False"

	if options[:extcap_config]
		extcap_config(options[:interface])
	elsif options[:extcap_dlts]
		extcap_dlts(interface)
	elsif options[:capture]
		if !options[:fifo]
			puts "You must use --capture and --fifo together"
			exit 1
		end
		extcap_capture(options[:interface], options[:fifo],
			options[:delay], verify, options[:message], options[:remote])
	else
		usage()
		exit 1
	end
rescue => e
	puts "Unexpected exit: #{e}"
end
