-- This program will register a menu that will open a window with
-- a list of TLS conversations in the capture

-- 1.0.1 - Add check for missing tcp.stream

local tls_conv_info =
{
    version = "1.0.1",
    author = "Chuck Craft",
    description = "Look for missing TLS Handshakes",
}

set_plugin_info(tls_conv_info)

if not gui_enabled() then
    return
end

local tls_handshake_type_f = Field.new("tls.handshake.type")
local tcp_stream_f = Field.new("tcp.stream")

local function tls_conv_tap()
	-- Declare the window we will use
	local tw = TextWindow.new("TLS Conversations")

	-- Store tcp_stream and packet number for each packet with a TLS Handshake
	local hello = { stream={}, client={}, server={} } 

	-- this is our tap
	local tap = Listener.new("tls", "(tls.handshake.type == 1) or (tls.handshake.type == 2)")

	local function remove()
		-- this way we remove the listener that otherwise will remain running indefinitely
		tap:remove();
	end

	-- we tell the window to call the remove() function when closed
	tw:set_atclose(remove)

	-- this function will be called once for each packet
	function tap.packet(pinfo,tvb)
		local handshake_type = tls_handshake_type_f()()
		local tcp_stream

-- 1.0.1 - [Protocols in frame: eth:ethertype:ipv6:udp:radius:eap:tls] has no tcp.stream field
		if #{ tcp_stream_f() } > 0 then
			tcp_stream = tcp_stream_f()()
		else
			return
		end

		if handshake_type == 1  then
			hello.client[tcp_stream] = pinfo.number
		elseif handshake_type == 2 then
			hello.server[tcp_stream] = pinfo.number
		else
			return
		end

		-- if first time seeing this stream, add it to the list
		if not contains(hello.stream, tcp_stream) then
			hello.stream[#hello.stream+1] = tcp_stream
		end
	end

	-- this function will be called once every few seconds to update our window
	function tap.draw(t)
		local missing_handshake = {}
		local client_hello = ""
		local server_hello = ""
		tw:clear()
		tw:append("TCP_stream\tClient_hello\tServer_hello\n")
		tw:append("----------------------------------------------\n")
		for i,v in ipairs(hello.stream) do
			client_hello = tostring(hello.client[v])
			if client_hello == "nil" then
				client_hello = "*****"
			end
			server_hello = tostring(hello.server[v])
			if server_hello == "nil" then
				server_hello = "*****"
			end
			tw:append(tostring(v) .. "\t" .. client_hello .. "\t\t" .. server_hello .. "\n");

			if (hello.client[v] == nil) or (hello.server[v] == nil) then
				table.insert(missing_handshake,v)
			end
		end
		tw:append("\nTCP stream #s missing handshake:")
		for k,v in pairs(missing_handshake) do
			tw:append(" " .. tostring(v))
		end
	end

	-- this function will be called whenever a reset is needed
	-- e.g. when reloading the capture file
	function tap.reset()
		tw:clear()
		hello = { stream={}, client={}, server={} } 
	end
	
	-- does table already contain this value
	function contains(t,value)
		for i,v in pairs(t) do
			if v == value then
				return true
			end
		end
		return false
	end

	-- Ensure that all existing packets are processed.
	retap_packets()
end

-- using this function we register our function
-- to be called when the user selects the Tools->TLS->Conversations menu
register_menu("TLS/Conversations", tls_conv_tap, MENU_TOOLS_UNSORTED)
