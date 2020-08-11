*Verified with Wireshark SVN 45134*

# Lua Taps/Listeners

Taps are a mechanism to fetch data from every frame. They can be defined to use a display filter.

## A simple Tap

This tap is meant to be used as a script run by tshark. It counts the number of HTTP packets that occur during the trace. To run this tap on a trace file called *mylan.pcap* and assuming that tshark is in the path, one would issue the command **tshark -X lua\_script:simple\_http.lua -r mylan.pcap**

    -- simple_http.lua
    -- implements a very simple tap in Lua
    
    -- this is going to be our counter
    http_packets = 0
    
    -- this is going to be our tap
    tap_http = nil
    
    -- first we declare the tap called "http tap" with the filter it is going to use
    tap_http = Listener.new(nil,"http")
    
    -- this function will get called at the end(3) of the capture to print the summary
    function tap_http.draw()
        debug("http packets:" .. http_packets)
    end
    
    -- this function is going to be called once each time the filter of the tap matches
    function tap_http.packet()
        http_packets = http_packets + 1
    end
    
    -- this function will be called at the end of the capture run
    function tap_http.reset()
        http_packets = 0
    end

## GUI

    -- text_window_tap.lua
    -- an example of a tap that registers a menu
    -- and prints to a text window
    
    instances = 0 -- number of instances of the tap created so far
    
    function mytap_menu()
        instances = instances + 1
    
        local td = {}
        -- the tap data, locally accessible by every function of the tap
        -- beware not to use a global for taps with multiple instances or you might
        -- find it been written by more instances of the tap, not what we want.
        -- each tap will have its own private instance of td.
    
        td.win = TextWindow.new("My Tap " .. instances) -- the window we'll use
        td.text = "" -- the text of the tap
        td.instance = instances -- the instance number of this tap
    
        -- this tap will be local to the menu_function that called it
        local tap = Listener.new()
    
        -- callback to remove the tap when the text window closes
        function remove_tap()
            if tap and tap.remove then
                tap:remove()
            end
        end
    
        -- make sure the tap doesn't hang around after the window was closed
        td.win:set_atclose(remove_tap)
    
        -- this function will be called for every packet
        function tap.packet(pinfo,tvb,tapdata)
            local text = "packet " .. pinfo.number
            td.text = td.text .. "\n" .. text
            -- debug("packet " .. pinfo.number, tapdata.instance)
        end
    
        -- this function will be called once every few seconds to redraw the window
        function tap.draw()
            td.win:set(td.text)
            -- debug("draw", tapdata.instance)
        end
    end
    
    -- last we register the menu
    -- the first arg is the menu name
    -- the 2nd arg is the function to be called
    -- the third argument is the menu to hold this new menu
    register_menu("Lua Tap Test",mytap_menu,MENU_TOOLS_UNSORTED)
    
    -- debug("registered")

---

Imported from https://wiki.wireshark.org/Lua/Taps on 2020-08-11 23:16:13 UTC
