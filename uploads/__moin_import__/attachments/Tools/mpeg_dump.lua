
-- Wireshark extension to dump MPEG2 transport stream packets
--
-- To use this script:
-- 1. Save it in the Wireshark home directory e.g. c:\Program Files\Wireshark
-- 2. Edit init.lua in the Wireshark home directory and add the following line
--    dofile("mpeg_packets_dump.lua")
-- 3. Restart Wireshark to add the extension
-- 4. Capture some traffic which includes some MPEG transport packets, for
--    example, it has been tested with MPEG transmitted via UDP multicast.
-- 5. Stop the capture, and select Tools -> Dump MPEG TS Packets
-- 6. Enter the file where the mpeg stream should be saved. 
-- 7. In order to select only one of many streams, enter a wireshark filter
--    expression, or you can leave the filter blank.
-- 8. Press okay. Any MPEG packets in the current capture which were detected 
--    by the MPEG dissector and that match your filter will be dumped to 
--    your output file.
--
-- Tested with Wireshark 1.4.3
-- ryan.gorsuch_at_echostar_com
-- 2011-04-01

-- this is going to be our tap, output file, and counter
tap_mcast = nil
myfile = nil
mcast_packets = 0

-- declare some field extractors
mpeg_pid     = Field.new("mp2t.pid")
mpeg_payload = Field.new("mp2t.payload")
mpeg_pusi    = Field.new("mp2t.pusi")

-- do a payload dump when prompted by the user
function init_payload_dump(file,filter)

	mcast_packets = 0
	tap_mcast = Listener.new(nil,filter)
	myfile = io.open (file, "w+b")
	
	-- this function is going to be called once each time our filter matches
	function tap_mcast.packet(pinfo,tvb,tapdata)

		if ( mpeg_pid() ) then
			myfile:write( tobinary( tostring( tvb:range(42):bytes() ) ) )
			myfile:flush()
			mcast_packets = mcast_packets + 1
		end
	end
	
	-- re-inspect all the packets that are in the current capture
	retap_packets()
	myfile:close()
	tap_mcast:remove()
	debug("Dumped mpeg packets: " .. mcast_packets )
end

-- show this dialog when the user select "Dump" from the Tools menu
function begin_dialog_menu()	
	new_dialog("Dump MPEG TS Packets",init_payload_dump,"Output file","Packet filter (optional)\n\nExamples:\nip.dst == 225.1.1.4\nmp2t\nmp2t.pid == 0x300")
end

register_menu("Dump MPEG TS Packets",begin_dialog_menu,MENU_TOOLS_UNSORTED)


function hex(ascii_code)
	-- convert an ascii char code to an integer value "0" => 0, "1" => 1, etc
	if not ascii_code then
		return 0
	elseif ascii_code < 58 then
		return ascii_code - 48
	elseif ascii_code < 91 then
		return ascii_code - 65 + 10
	else
		return ascii_code - 97 + 10
	end
end

function tobinary(hexbytes)
-- this function converts a hex-string to raw bytes
	
	binary = ""
	
	for i=1,string.len(hexbytes),2 do
		byte = 16 * hex( string.byte(hexbytes,i) ) + hex( string.byte(hexbytes,i+1) )
		binary = binary .. string.char( byte )
		
	end

	return binary
	
end
