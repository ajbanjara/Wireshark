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