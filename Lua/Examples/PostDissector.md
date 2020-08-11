# A post-dissector example

Well let's say that we want to filter packets of sessions where there has been a long gap between packets.

[maxgap.lua](uploads/__moin_import__/attachments/Lua/Examples/PostDissector/maxgap.lua)

    -- max_gap.lua
    -- create a gap.max field containing the maximum gap between two packets between two ip nodes
    
    -- we create a "protocol" for our tree
    local max_gap_p = Proto("gap","Gap in IP conversations")
    
    -- we create our fields
    local max_gap_field = ProtoField.float("gap.max")
    
    -- we add our fields to the protocol
    max_gap_p.fields = { max_gap_field }
    
    -- then we register max_gap_p as a postdissector
    register_postdissector(max_gap_p)
    
    local gaps = {} -- the maximum gap sofar between two nodes  
    local last = {} -- the last time a packet was seen between two nodes
    
    -- a debug logging function (adds into dissector proto tree)
    local enable_logging = false   -- set this to true to enable it!!
    local function initLog(tree, proto)
        if not enable_logging then
            -- if logging is disabled, we return a dummy function
            return function() return end
        end
        local log_tree = tree:add(proto, nil, "Debug Log")
        log_tree:set_generated()
        -- return a function that when called will add a new child with the given text
        return function(str) log_tree:add(proto):set_text(str) end
    end
    
    -- let's do it!
    function max_gap_p.dissector(tvb,pinfo,tree)
    
        local addr_lo = pinfo.net_src
        local addr_hi = pinfo.net_dst
    
        if addr_lo > addr_hi then
            addr_hi,addr_lo = addr_lo,addr_hi
        end
    
        local conv_key =  tostring(addr_lo) .. " " .. tostring(addr_hi)
        local this_gap = 0
        local max_gap = 0
    
        -- initialize logging, getting the logging function to use later
        local log = initLog(tree,max_gap_p)
        
        log("Key:".. conv_key)
        log("Visited: " .. tostring(pinfo.visited))
        
        if not pinfo.visited then
            local now = pinfo.rel_ts
    
            log("Now: "..now)
            
            if last[conv_key] then 
                this_gap = now - last[conv_key]
    
                log("A subsequent Packet, Gap: "..this_gap)
                
                if gaps[conv_key] then
                    max_gap = gaps[conv_key]
                    log("Got Old Max Gap: " .. max_gap)
                end
                
                if max_gap < this_gap then
                    log("New Gap is Bigger")
                    gaps[conv_key] = this_gap
                    max_gap = this_gap
                end
            else
                log("First Packet, no gap!")
            end 
    
            last[conv_key] = now
    
        else
           max_gap = gaps[conv_key]
        end
        
        if max_gap then
            tree:add(max_gap_field,max_gap):set_generated()
        end
    
    end

# Another post-dissector example

Let's suppose we want to display all IPv6 addresses, but fully expanded.

[ipv6-postdissector.lua](uploads/__moin_import__/attachments/Lua/Examples/PostDissector/ipv6-postdissector.lua)

    --[[
        iv6-postdissector.lua
        Fully expand all IPv6 addresses.
    --]]
    
    local ipv6_post_info =
    {
        version = "1.0.0",
        author = "Christopher Maynard",
        description = "IPv6 Postdissector that fully expands all IPv6 addresses",
    }
    
    set_plugin_info(ipv6_post_info)
    
    local ipv6_post = Proto("IPv6Post", "IPv6 Postdissector")
    
    local pf = {
        ipv6_src_expanded = ProtoField.string("ipv6_post.src_expanded", "Source (Expanded)"),
        ipv6_dst_expanded = ProtoField.string("ipv6_post.dst_expanded", "Destination (Expanded)"),
        ipv6_addr_expanded = ProtoField.string("ipv6_post.addr_expanded", "Source or Destination Address (Expanded)"),
    }
    
    -- Register protocol fields
    ipv6_post.fields = pf
    
    local ipv6_src = Field.new("ipv6.src")
    local ipv6_dst = Field.new("ipv6.dst")
    local ipv6_addr = Field.new("ipv6.addr")
    
    function ipv6_post.dissector(tvbuf, pinfo, tree)
    
        local ipv6_src_ex = {ipv6_src()}
        local ipv6_dst_ex = {ipv6_dst()}
        local ipv6_addr_ex = {ipv6_addr()}
    
        if ipv6_src_ex ~= nil then
    
            local ipv6_post_tree = tree:add(ipv6_post, "IPv6 Postdissector")
            local ipv6_expanded
            local i
    
            for i in pairs(ipv6_src_ex) do
                ipv6_tvb = ipv6_src_ex[i].range()
                ipv6_expanded = string.format("%04x:%04x:%04x:%04x:%04x:%04x:%04x:%04x",
                    ipv6_tvb(0, 2):uint(), ipv6_tvb(2, 2):uint(),
                    ipv6_tvb(4, 2):uint(), ipv6_tvb(6, 2):uint(),
                    ipv6_tvb(8, 2):uint(), ipv6_tvb(10, 2):uint(),
                    ipv6_tvb(12, 2):uint(), ipv6_tvb(14, 2):uint())
                ipv6_post_tree:add(pf.ipv6_src_expanded, ipv6_expanded)
            end
    
            for i in pairs(ipv6_dst_ex) do
                ipv6_tvb = ipv6_dst_ex[i].range()
                ipv6_expanded = string.format("%04x:%04x:%04x:%04x:%04x:%04x:%04x:%04x",
                    ipv6_tvb(0, 2):uint(), ipv6_tvb(2, 2):uint(),
                    ipv6_tvb(4, 2):uint(), ipv6_tvb(6, 2):uint(),
                    ipv6_tvb(8, 2):uint(), ipv6_tvb(10, 2):uint(),
                    ipv6_tvb(12, 2):uint(), ipv6_tvb(14, 2):uint())
                ipv6_post_tree:add(pf.ipv6_dst_expanded, ipv6_expanded)
            end
    
            for i in pairs(ipv6_addr_ex) do
                ipv6_tvb = ipv6_addr_ex[i].range()
                ipv6_expanded = string.format("%04x:%04x:%04x:%04x:%04x:%04x:%04x:%04x",
                    ipv6_tvb(0, 2):uint(), ipv6_tvb(2, 2):uint(),
                    ipv6_tvb(4, 2):uint(), ipv6_tvb(6, 2):uint(),
                    ipv6_tvb(8, 2):uint(), ipv6_tvb(10, 2):uint(),
                    ipv6_tvb(12, 2):uint(), ipv6_tvb(14, 2):uint())
                ipv6_post_tree:add(pf.ipv6_addr_expanded, ipv6_expanded)
            end
    
        end
    
    end
    
    register_postdissector(ipv6_post)

---

Imported from https://wiki.wireshark.org/Lua/Examples/PostDissector on 2020-08-11 23:16:11 UTC
