-------------------------------------------------
-- TRANSUM Response Time Element postdissector --
-------------------------------------------------

-------------------------------------------------
-- Copyright - Advance Seven Limited, 2014
-- License - GNU GPL v3
--      see http://www.gnu.org/licenses/gpl.html
-------------------------------------------------

-------------------------------------------------
-- This code is an output from the Advance7
-- TribeLab project - see www.tribelabzero.com
-------------------------------------------------

-------------------------------------------------
-- Acknowledgements
--
-- Neil Hatton of Advance7 for his work on the
-- original SAS transum code.  Jeff Brown of
-- Emulex Endace for sharing with us his work on
-- a LUA dissector.
-------------------------------------------------

------------------------History--------------------------
-- r3 - pjo - Fixed bug so that RTE data appears in
--            last req and added SYN SYN/ACK measurement.
-- r4 - pjo - Added preference form and experimental
--            trace clip filter.
-- r5 - pjo - Replaced test of tcp.len>1 for data pkt
--            to tcp.len>0 and not tcp_keep_alive.
--            Added tcp.len>0 to the trace clip filter.
--            Added better handling of retransmissions
--            although it's still not perfect.
-- r6 - pjo - Shortened RTE column labels
-- r8 - pjo - Separated the RTE timing code into
--            DCE-RPC, SMB2 and Generic TCP
-- r9 - pjo - SMB2 support added.  Extended options
--            for RTE data placement.
-- r9a - pjo - Fixed problem with multi-packet
--             SMB2 requests
-- r9b - pjo - Fixed SMB2 decode stream index value
---------------------------------------------------------

-- Add entries to the service port table for packets to be treated as services
-- This is populated with preferences "service ports" data
service_port = {}

-- declare the extractors for some Fields to be read
-- these work like getters
eth_type_f = Field.new("eth.type")
ip_proto_f = Field.new("ip.proto")
tcp_src_f = Field.new("tcp.srcport")
tcp_dst_f = Field.new("tcp.dstport")
tcp_stream_f = Field.new("tcp.stream")
tcp_retran_f = Field.new("tcp.analysis.retransmission")
tcp_keep_alive_f = Field.new("tcp.analysis.keep_alive")
tcp_len_f = Field.new("tcp.len")
syn_flag_f = Field.new("tcp.flags.syn")
ack_flag_f = Field.new("tcp.flags.ack")

smb2_msg_id_f = Field.new("smb2.msg_id")
smb2_sesid_f = Field.new("smb2.sesid")

smb_mid_f = Field.new("smb.mid")

-- declare the RTE data as a protocol
transum = Proto("transum","TRANSUM Postdissector")

-- add the field to the protocol
-- create the fields for our "protocol"
rte_firstreq_F = ProtoField.string("transum.firstreq","Req First Seg")
rte_lastreq_F = ProtoField.string("transum.lastreq","Req Last Seg")
rte_firstrsp_F = ProtoField.string("transum.firstrsp","Rsp First Seg")
rte_lastrsp_F = ProtoField.string("transum.lastrsp","Rsp Last Seg")

rte_art_F = ProtoField.float("transum.art","APDU Rsp Time")
rte_st_F = ProtoField.float("transum.st","Service Time")
rte_reqspread_F = ProtoField.float("transum.reqspread","Req Spread")
rte_rspspread_F = ProtoField.float("transum.rspspread","Rsp Spread")

rte_clipfilter_F = ProtoField.string("transum.clip_filter","Trace clip filter")

rte_calculation_F = ProtoField.string("transum.calculation", "Calculation")

-- add the field to the protocol
transum.fields = {rte_firstreq_F, rte_firstrsp_F, rte_lastreq_F, rte_lastrsp_F, rte_art_F, rte_st_F, rte_reqspread_F, rte_rspspread_F, transum_debug_F, rte_clipfilter_F,rte_calculation_F}

-- create tables to store per TCP stream information for initial dissection
debug_val = 0

stream_req_first = {}
stream_req_last = {}
stream_rsp_first = {}
stream_rsp_last = {}

stream_relts_req_first = {}
stream_relts_req_last = {}
stream_relts_rsp_first = {}
stream_relts_rsp_last = {}

stream_calculation = {}

stream_dir = {}

-- the following are used by the SMB2 dissector
within_spdu_c2s = {}  -- index is the stream number
within_spdu_s2c = {}  -- index is the stream number

-- The following table elements hold a count of APDU reqs
smb2_msg_to_arr_id = {}  -- index is sessionid:msgid, element is an APDU Req-Rsp ID
current_c2s_arr_id_for_stream = {}
current_s2c_arr_id_for_stream = {}

-- index into these tables with the packet (frame) number
rte_req_first = {}
rte_req_last = {}
rte_rsp_first = {}
rte_rsp_last = {}

rte_relts_req_first = {}
rte_relts_req_last = {}
rte_relts_rsp_first = {}
rte_relts_rsp_last = {}

rte_art = {}
rte_st = {}
rte_reqspread = {}
rte_rspspread = {}
rte_calculation = {}

-- The following are set by the dissectors and used in the output stage
-- Index in each case is a frame number
first_req_to_arr_id = {}
last_req_to_arr_id = {}
first_rsp_to_arr_id = {}
last_rsp_to_arr_id = {}


function string:explode( inSplitPattern, outResults )
  if not outResults then
    outResults = { }
  end
  local theStart = 1
  local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
  while theSplitStart do
    table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
    theStart = theSplitEnd + 1
    theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
  end
  table.insert( outResults, string.sub( self, theStart ) )
  return outResults
end

-- This function gets called when a new trace file is loaded
function transum.init()
  init_globals()
end

-- This function initialises the global variables and populates the
-- service_port table with information from the preference settings
function init_globals()
    -- the following table is used if add_to_last_req is set to 1
    -- the index is the last_req frame number and the value in the table
    -- is the associated apdu_id
    
    stream_req_first = {}
    stream_req_last = {}
    stream_rsp_first = {}
    stream_rsp_last = {}
    
    stream_relts_req_first = {}
    stream_relts_req_last = {}
    stream_relts_rsp_first = {}
    stream_relts_rsp_last = {}
    
    stream_calculation = {}
    
    stream_dir = {}   -- used to track direction 0 = S->C, 1 = C->S

    within_spdu_c2s = {}  -- index is the stream number
    within_spdu_s2c = {}  -- index is the stream number

    smb2_msg_to_arr_id = {}  -- index is sessionid:msgid, element is an APDU Req-Rsp ID
    current_c2s_arr_id_for_stream = {}
    current_s2c_arr_id_for_stream = {}

    rte_req_first = {}
    rte_req_last = {}
    rte_rsp_first = {}
    rte_rsp_last = {}
    
    rte_relts_req_first = {}
    rte_relts_req_last = {}
    rte_relts_rsp_first = {}
    rte_relts_rsp_last = {}

    rte_art = {}
    rte_st = {}
    rte_reqspread = {}
    rte_rspspread = {}
    rte_calculation = {}
    
    first_req_to_arr_id = {}
    last_req_to_arr_id = {}
    first_rsp_to_arr_id = {}
    last_rsp_to_arr_id = {}

    -- Deal with the TRANSUM protocol preferences
    service_port = {}

    local prefs_table = transum.prefs.ports:explode(",")
    for i = 1, #prefs_table do
        service_port[tonumber(prefs_table[i])] = true
    end
    
end

-- This function initialises the table entries for a particular stream
function init_stream_vars(s)
    stream_req_first[s] = nil
    stream_req_last[s] = nil
    stream_rsp_first[s] = nil
    stream_rsp_last[s] = nil
    
    stream_relts_req_first[s] = nil
    stream_relts_req_last[s] = nil
    stream_relts_rsp_first[s] = nil
    stream_relts_rsp_last[s] = nil
    
    stream_calculation[s] = nil
end

-- This function adds the RTE data to the tree
function write_rte(apdu_id, tree)
  local subtree = tree:add(transum,"TRANSUM RTE Data")
  local new_item
  local stream = tcp_stream_f()
  
  new_item = subtree:add(rte_firstreq_F,tostring(rte_req_first[apdu_id]))
  new_item:set_generated()
  new_item = subtree:add(rte_lastreq_F,tostring(rte_req_last[apdu_id]))
  new_item:set_generated()
  new_item = subtree:add(rte_firstrsp_F,tostring(rte_rsp_first[apdu_id]))
  new_item:set_generated()
  new_item = subtree:add(rte_lastrsp_F,tostring(rte_rsp_last[apdu_id]))
  new_item:set_generated()

  if rte_rsp_first[apdu_id] then
    new_item = subtree:add(rte_art_F, rte_art[apdu_id])
    new_item:set_generated()
    new_item = subtree:add(rte_st_F, rte_st[apdu_id])
    new_item:set_generated()
  end

  -- there will always be at least 1 request packet
  -- useful to output for things like the FTP data stream
  new_item = subtree:add(rte_reqspread_F, rte_reqspread[apdu_id])
  new_item:set_generated()
  
  if rte_rsp_first[apdu_id] then
    new_item = subtree:add(rte_rspspread_F, rte_rspspread[apdu_id])
    new_item:set_generated()
  end
  
  if transum.prefs.gen_clip_filter then
    local filter_string = ""
    
    if rte_rsp_last[apdu_id] then
      filter_string = "tcp.stream==" .. tostring(stream) .. " && frame.number>=" .. tostring(rte_req_first[apdu_id]) .. " && frame.number<=" .. tostring(rte_rsp_last[apdu_id]) .. " && tcp.len>0"
    else
      filter_string = "tcp.stream==" .. tostring(stream) .. " && frame.number>=" .. tostring(rte_req_first[apdu_id]) .. " && frame.number<=" .. tostring(rte_rsp_last[apdu_id]) .. " && tcp.len>0"
    end
    
    new_item = subtree:add(rte_clipfilter_F, filter_string)
    new_item:set_generated()
  end
  
  new_item = subtree:add(rte_calculation_F, rte_calculation[apdu_id])
  new_item:set_generated()
  
end

-- This function takes a snapshot of the data for a stream and plugs the values into the RTE tables
-- There will be one entry in the RTE tables for each APDU RR pair
-- The index (arr_id) into the RTE tables is the packet number of the first request packet and so the
-- first request packet number effectively becomes the APDU RR Pair ID
-- The input parameter s is the stream number
function snapshot(s)
    local arr_id = stream_req_first[s]   -- get the APDU RR Pair ID

    -- Need to do the following before we set new last frame values
    if last_req_to_arr_id[rte_req_last[arr_id]] then
      last_req_to_arr_id[rte_req_last[arr_id]] = nil  -- drop the previous value for the reverse lookup
    end
      
    if last_rsp_to_arr_id[rte_rsp_last[arr_id]] then
      last_rsp_to_arr_id[rte_rsp_last[arr_id]] = nil  -- drop the previous value for the reverse lookup
    end

    rte_req_first[arr_id] = stream_req_first[s]
    rte_req_last[arr_id] = stream_req_last[s]
    rte_rsp_first[arr_id] = stream_rsp_first[s]
    rte_rsp_last[arr_id] = stream_rsp_last[s]
    rte_calculation[arr_id] = stream_calculation[s]
    
    -- snapshot calculated times into the rte tables (indexed by packet)
    rte_art[arr_id] = stream_relts_rsp_last[s] - stream_relts_req_first[s]
    rte_st[arr_id] = stream_relts_rsp_first[s] - stream_relts_req_last[s]
    rte_reqspread[arr_id] = stream_relts_req_last[s] - stream_relts_req_first[s]
    rte_rspspread[arr_id] = stream_relts_rsp_last[s] - stream_relts_rsp_first[s]

    -- The following is code for the option to output the RTE data
    -- to the first and/or last request and/or response
    first_req_to_arr_id[rte_req_first[arr_id]] = arr_id
    last_req_to_arr_id[rte_req_last[arr_id]] = arr_id
    first_rsp_to_arr_id[rte_rsp_first[arr_id]] = arr_id
    last_rsp_to_arr_id[rte_rsp_last[arr_id]] = arr_id
end

-- This function is called to determine the protocol of the current packet
-- It returns the following values
--  MRPC for MS-RPC
--  SMB2 for SMB2 / CIFS
--  GTCP for Generic TCP (effectively any TCP that doesn't fall into the preceding protocols)
--  SYN  for any TCP protocol
--  GUDP for Generic UDP
--  null meaning that we are not interested in this packet
function proto_detect(buffer,pinfo,tree)
  local eth_type = eth_type_f()
  local ip_proto = ip_proto_f()
  local smb_mid = smb_mid_f()
  local f = tonumber(pinfo.number)   -- easy access to frame number

  -- only run for TCP packets
  if eth_type.value == 0x0800 then
    if ip_proto.value == 6 then
      -- It's TCP
      local tcp_src = tcp_src_f()
      local tcp_dst = tcp_dst_f()
      --local syn_flag = syn_flag_f()
      local syn_flag = tonumber(tostring(syn_flag_f()))

      -- we only want to run the following if we have traffic to or from one of the service ports that interests us
      if syn_flag == 1 then
        return "SYN"

      elseif service_port[tcp_src.value] or service_port[tcp_dst.value] then
        return "GTCP"

      elseif tcp_src.value == 445 or tcp_dst.value == 445 then
        if smb_mid then
          return "SMB1"
        else
          return "SMB2"
        end
      end
    elseif ip_proto.value == 17 then
      -- It's UDP
    end
  end   
  -- If we got this far we are not interested in this packet
  return null
end

-- This function is called to handle packets detected as MS-RPC
function dissect_mrpc(buffer,pinfo,tree)
  return
end

-- This function is called to handle packets detected as SMB2
-- Call this if transum.prefs.reassembly is true
function dissect_smb2(buffer,pinfo,tree)
  -- In this code we use the concept of SPDUs as well as APDUs
  -- A SPDU is a Session PDU that is passed to TCP
  -- The SPDU may contain multiple APDUs i.e. multiple SMB messages within
  -- a sequence of an initial segment plus continuation segments

  -- A "req" SPDU could contain multiple Req APDUs but the responses may come back separately
  -- Because we only want one APDU Response Time value we measure from the first packet of the "req" SPDU
  -- to the last packet of the last Response APDU to be returned.  This way we measure worst case.

  local f = tonumber(pinfo.number)   -- easy access to frame number
  local tcp_src = tcp_src_f()
  local tcp_dst = tcp_dst_f()
  local retran = tcp_retran_f()
  local tcp_keep_alive = tcp_keep_alive_f()
  local tcp_len = tcp_len_f()
  local stream = tcp_stream_f()
  local s = tonumber(stream.value)  -- easy access to tcp stream number
  local t = pinfo.rel_ts   -- easy way to reference frame's seconds since start of capture

  local smb2_sesid_table = { smb2_sesid_f() }
  local smb2_msg_id_table = { smb2_msg_id_f() }
  local sessionid_msgid = nil  -- used as the unique identifier for a message
  local arr_id = 0  -- APDU Req-Rsp ID

  -- Only run if this is a stream and there is tcp payload
  -- Don't run if this is a keep alive
  if tcp_len.value == 0 or tcp_keep_alive then
    return;
  end
      
  -- set the direction for this stream
  if tcp_dst.value == 445 then
    stream_dir[s] = 1
    if current_c2s_arr_id_for_stream[s] then arr_id = current_c2s_arr_id_for_stream[s] end
  else
    stream_dir[s] = 0
    if current_s2c_arr_id_for_stream[s] then arr_id = current_s2c_arr_id_for_stream[s] end
  end

  -- Ignore retransmissions going C2S captured adjacent to the service
  if (not transum.prefs.client_side) and retran and stream_dir[s] == 1 then
    return
  end

  -- Ignore retransmissions going S2C captured adjacent to the client
  if transum.prefs.client_side and retran and stream_dir[s] == 0 then
    return
  end

  if stream_dir[s] == 1 then  -- it's a Request APDU going c2s

    if not within_spdu_c2s[s] then
      within_spdu_c2s[s] = true
      arr_id = f
      current_c2s_arr_id_for_stream[s] = arr_id
      rte_req_first[arr_id] = f
      rte_relts_req_first[arr_id] = t
    end
  else -- Must be going s2c
    -- Need to add something here to cope with standalone Break Response messages  
    if not within_spdu_s2c[s] then
      within_spdu_s2c[s] = true
      stream_rsp_first[s] = f
      stream_relts_rsp_first[s] = t
    end -- already in an SPDU so nothing to do until we hit a packet with decode info
  end

  if smb2_sesid_table[1] then  -- If session ID set
    -- Grab the sesid and msg_ids and save them (but where Lois?)
    local message = nil
    local session = nil
      
    for i, msg_id in ipairs(smb2_msg_id_table) do
      message = tostring(msg_id.value)
      session = tostring(smb2_sesid_table[i])
      sessionid_msgid = session .. ":" .. message
      
      if message == -1 then break end
      
      -- If c2s
      if stream_dir[s] == 1 then  -- it's a Request APDU going c2s
        -- this must be the last frame for this Request so save all of the RTE data into appropriate
        -- message structures for this message
        smb2_msg_to_arr_id[sessionid_msgid] = arr_id
        
        within_spdu_c2s[s] = false  -- if this SPDU has decode info it must be the end of the SPDU
        
      else -- it's an Response APDU going s2c
        -- We don't snapshot in this dissector
        -- we just continuously update on the basis that the last time through for all messages
        -- will update the correct information as everything is indexed on arr_id

        if not smb2_msg_to_arr_id[sessionid_msgid] then
          within_spdu_s2c[s] = false
          return  -- Bail if we don't have a request for this response
        end
        
        arr_id = smb2_msg_to_arr_id[sessionid_msgid]
        
        rte_rsp_first[arr_id] = stream_rsp_first[s]
        rte_rsp_last[arr_id] = f
        rte_relts_rsp_first[arr_id] = stream_relts_rsp_first[s]
        rte_relts_rsp_last[arr_id] = t
        rte_calculation[arr_id] = "SMB2"

        within_spdu_s2c[s] = false  -- if this SPDU has decode info it must be the end of the SPDU
      end
    end
  end

  -- Need to do the following before we set new last frame values
  if last_req_to_arr_id[rte_req_last[arr_id]] then
    last_req_to_arr_id[rte_req_last[arr_id]] = nil  -- drop the previous value for the reverse lookup
  end
    
  if last_rsp_to_arr_id[rte_rsp_last[arr_id]] then
    last_rsp_to_arr_id[rte_rsp_last[arr_id]] = nil  -- drop the previous value for the reverse lookup
  end

  if stream_dir[s] == 1 then  -- it's a Request APDU going c2s
    rte_req_last[arr_id] = f
    rte_relts_req_last[arr_id] = t
  else
    rte_rsp_last[arr_id] = f
    rte_relts_rsp_last[arr_id] = t
  end

  if rte_relts_req_last[arr_id] and rte_relts_rsp_last[arr_id] then
  
    -- The following is code for the option to output the RTE data
    -- to the first and/or last request and/or response
    first_req_to_arr_id[rte_req_first[arr_id]] = arr_id
    last_req_to_arr_id[rte_req_last[arr_id]] = arr_id
    first_rsp_to_arr_id[rte_rsp_first[arr_id]] = arr_id
    last_rsp_to_arr_id[rte_rsp_last[arr_id]] = arr_id
    
    -- Calculate times for the rte tables (indexed by APDU RR ID)
    rte_art[arr_id] = rte_relts_rsp_last[arr_id] - rte_relts_req_first[arr_id]
    rte_st[arr_id] = rte_relts_rsp_first[arr_id] - rte_relts_req_last[arr_id]
    rte_reqspread[arr_id] = rte_relts_req_last[arr_id] - rte_relts_req_first[arr_id]
    rte_rspspread[arr_id] = rte_relts_rsp_last[arr_id] - rte_relts_rsp_first[arr_id]
    rte_calculation[arr_id] = "SMB2"
  end
  
  return
end

-- This function is called to handle packets detected as SMB2
-- and reassembly option is not set
function dissect_smb2_nra(buffer,pinfo,tree)
  -- In this code we use the concept of SPDUs as well as APDUs
  -- A SPDU is a Session PDU that is passed to TCP
  -- The SPDU may contain multiple APDUs i.e. multiple SMB messages within
  -- a sequence of an initial segment plus continuation segments

  -- A "req" SPDU could contain multiple Req APDUs but the responses may come back separately
  -- Because we only want one APDU Response Time value we measure from the first packet of the "req" SPDU
  -- to the last packet of the last Response APDU to be returned.  This way we measure worst case.

  -----------------------------------------------------------
  -- THIS CODE EXECUTED IF SUBDISSECTOR REASSEMBLY IS NOT SET
  -----------------------------------------------------------

  local f = tonumber(pinfo.number)   -- easy access to frame number
  local tcp_src = tcp_src_f()
  local tcp_dst = tcp_dst_f()
  local retran = tcp_retran_f()
  local tcp_keep_alive = tcp_keep_alive_f()
  local tcp_len = tcp_len_f()
  local stream = tcp_stream_f()
  local s = tonumber(stream.value)  -- easy access to tcp stream number
  local t = pinfo.rel_ts   -- easy way to reference frame's seconds since start of capture

  local smb2_sesid_table = { smb2_sesid_f() }
  local smb2_msg_id_table = { smb2_msg_id_f() }
  local sessionid_msgid = nil  -- used as the unique identifier for a message
  local arr_id = 0  -- APDU Req-Rsp ID

  -- Only run if this is a stream and there is tcp payload
  -- Don't run if this is a keep alive
  if tcp_len.value == 0 or tcp_keep_alive then
    return;
  end

  -- set the direction for this stream
  if tcp_dst.value == 445 then
    stream_dir[s] = 1
    if current_c2s_arr_id_for_stream[s] then arr_id = current_c2s_arr_id_for_stream[s] end
  else
    stream_dir[s] = 0
    if current_s2c_arr_id_for_stream[s] then arr_id = current_s2c_arr_id_for_stream[s] end
  end

  -- Ignore retransmissions going C2S captured adjacent to the service
  if (not transum.prefs.client_side) and retran and stream_dir[s] == 1 then
    return
  end

  -- Ignore retransmissions going S2C captured adjacent to the client
  if transum.prefs.client_side and retran and stream_dir[s] == 0 then
    return
  end

  if smb2_sesid_table[1] then  -- If session ID set
    -- Grab the sesid and msg_ids and save them (but where Lois?)
    local message = nil
    local session = nil

    for i, msg_id in ipairs(smb2_msg_id_table) do
      message = tostring(msg_id.value)
      session = tostring(smb2_sesid_table[i])
      sessionid_msgid = session .. ":" .. message
      
      if message == -1 then break end
      
      -- If c2s
      if stream_dir[s] == 1 then  -- it's a Request APDU going c2s
        -- this must be the first frame for this Request so save all of the RTE data into appropriate
        -- message structures for this message
        arr_id = f
        current_c2s_arr_id_for_stream[s] = f
        smb2_msg_to_arr_id[sessionid_msgid] = f

        rte_req_first[arr_id] = f
        rte_relts_req_first[arr_id] = t

      else -- it's an Response APDU going s2c
        -- We don't snapshot in this dissector
        -- we just continuously update on the basis that the last time through for all messages
        -- will update the correct information as everything is indexed on arr_id

        if not smb2_msg_to_arr_id[sessionid_msgid] then
          current_s2c_arr_id_for_stream[s] = nil
          return  -- Bail if we don't have a request for this response
        end

        arr_id = smb2_msg_to_arr_id[sessionid_msgid]
        current_s2c_arr_id_for_stream[s] = arr_id

        rte_rsp_first[arr_id] = f
        rte_relts_rsp_first[arr_id] = t
      end
    end
  end

  -- Need to do the following before we set new last frame values
  if last_req_to_arr_id[rte_req_last[arr_id]] then
    last_req_to_arr_id[rte_req_last[arr_id]] = nil  -- drop the previous value for the reverse lookup
  end
    
  if last_rsp_to_arr_id[rte_rsp_last[arr_id]] then
    last_rsp_to_arr_id[rte_rsp_last[arr_id]] = nil  -- drop the previous value for the reverse lookup
  end

  if stream_dir[s] == 1 then  -- it's a Request APDU going c2s
    rte_req_last[arr_id] = f
    rte_relts_req_last[arr_id] = t
  else
    rte_rsp_last[arr_id] = f
    rte_relts_rsp_last[arr_id] = t
  end

  if rte_relts_req_last[arr_id] and rte_relts_rsp_last[arr_id] then
  
    -- The following is code for the option to output the RTE data
    -- to the first and/or last request and/or response
    first_req_to_arr_id[rte_req_first[arr_id]] = arr_id
    last_req_to_arr_id[rte_req_last[arr_id]] = arr_id
    first_rsp_to_arr_id[rte_rsp_first[arr_id]] = arr_id
    last_rsp_to_arr_id[rte_rsp_last[arr_id]] = arr_id
    
    -- Calculate times for the rte tables (indexed by APDU RR ID)
    rte_art[arr_id] = rte_relts_rsp_last[arr_id] - rte_relts_req_first[arr_id]
    rte_st[arr_id] = rte_relts_rsp_first[arr_id] - rte_relts_req_last[arr_id]
    rte_reqspread[arr_id] = rte_relts_req_last[arr_id] - rte_relts_req_first[arr_id]
    rte_rspspread[arr_id] = rte_relts_rsp_last[arr_id] - rte_relts_rsp_first[arr_id]
    rte_calculation[arr_id] = "SMB2"
  end
  
  return
end

-- This function is called to handle packets detected as Generic TCP
function dissect_gtcp(buffer,pinfo,tree)
  local f = tonumber(pinfo.number)   -- easy access to frame number
  local tcp_src = tcp_src_f()
  local tcp_dst = tcp_dst_f()
  local retran = tcp_retran_f()
  local tcp_keep_alive = tcp_keep_alive_f()
  local new_apdu_rr = {}  -- used to track start of a new APDU RR pair
  local tcp_len = tcp_len_f()
  local stream = tcp_stream_f()
  local s = tonumber(stream.value)  -- easy access to tcp stream number
  local t = pinfo.rel_ts   -- easy way to reference frame's seconds since start of capture

  -- Only run if this is a stream and there is tcp payload
  -- Don't run if this is a keep alive
  if tcp_len.value > 0 and not tcp_keep_alive then
      
    -- set a default stream direction if necessary
    if not stream_dir[s] then stream_dir[s] = 0 end
        
    -- check for new APDU RR Pair
    if service_port[tcp_dst.value] and stream_dir[s] == 0 then
      new_apdu_rr[s] = 1
    else
      new_apdu_rr[s] = nil
    end

    -- If we have detected a new APDU RR pair we need to
    -- initialise the information table entries for this stream
    if new_apdu_rr[s] then
      init_stream_vars(s)
    end

    -- set the direction flag 0 = S->C, 1 = C->S
    if service_port[tcp_dst.value] then stream_dir[s] = 1 else stream_dir[s] = 0 end

    if stream_dir[s] == 1 then
      -- This packet is going client to service
      
      -- The following line needs to be reviewed as we can't guarantee that the initial table won't have entries with a value of 0
      -- If this is a service-side trace we need to ignore client-to-service TCP retransmissions
      -- the rationale being that if we saw the original in the trace the service process saw it too
      if (not transum.prefs.client_side) and retran then
        -- ignore this packet
      else
        if new_apdu_rr[s] then
          stream_req_first[s] = f
          stream_relts_req_first[s] = t
          stream_req_last[s] = f
          stream_relts_req_last[s] = t
                
          -- need to do the following just in case we've had a response without a request
          stream_rsp_first[s] = nil
          stream_rsp_last[s] = nil
          stream_relts_rsp_first[s] = nil
          stream_relts_rsp_last[s] = nil
        end
        -- assume this is the last request frame for this APDU
        stream_req_last[s] = f
        stream_relts_req_last[s] = t
      end
    else
      -- This packet is going service to client 
      
      -- If this is a client-side trace we need to ignore service-to-client TCP retransmissions
      -- the rationale being that if we saw the original in the trace the client process saw it too
      if transum.prefs.client_side and retran then
        -- ignore this packet
      else
        if not stream_rsp_first[s] then
          stream_rsp_first[s] = f
          stream_relts_rsp_first[s] = t
          stream_rsp_last[s] = f
          stream_relts_rsp_last[s] = t
        end
        -- assume this is the last response packet for this APDU
        stream_rsp_last[s] = f
        stream_relts_rsp_last[s] = t
      end
    end
    
    stream_calculation[s] = "Generic TCP"

    -- Snapshot the data for the current APDU pair on this stream
    -- We have to do this every time as we don't know when the stream will end
    snapshot(s)
    new_apdu_rr[s] = nil
  end
end

-- This function is called to handle SYN and SYN/ACKs
function dissect_syn(buffer,pinfo,tree)
  local f = tonumber(pinfo.number)   -- easy access to frame number
  local tcp_src = tcp_src_f()
  local tcp_dst = tcp_dst_f()
  local retran = tcp_retran_f()
  local tcp_keep_alive = tcp_keep_alive_f()
  local syn_flag = tonumber(tostring(syn_flag_f()))
  local ack_flag = tonumber(tostring(ack_flag_f()))
  local new_apdu_rr = {}  -- used to track start of a new APDU RR pair
  local tcp_len = tcp_len_f()
  local stream = tcp_stream_f()
  local s = tonumber(stream.value)  -- easy access to tcp stream number
  local t = pinfo.rel_ts   -- easy way to reference frame's seconds since start of capture

  if syn_flag == 1 then
      
    -- check for new APDU RR Pair
    -- true if SYN but no ACK
    if ack_flag == 1 then
      new_apdu_rr[s] = nil
      stream_dir[s] = 0   --  Set direction Service to Client
    else
      new_apdu_rr[s] = 1
      stream_dir[s] = 1   --  Set direction Client to Service
    end

    -- If we have detected a new APDU RR pair we need to
    -- initialise the information table entries for this stream
    if new_apdu_rr[s] then
      init_stream_vars(s)
    end

    if stream_dir[s] == 1 then
      -- This packet is going client to service
      
      -- The following line needs to be reviewed as we can't guarantee that the initial table won't have entries with a value of 0
      -- If this is a service-side trace we need to ignore client-to-service TCP retransmissions
      -- the rationale being that if we saw the original in the trace the service process saw it too
      if (not transum.prefs.client_side) and retran then
        -- ignore this packet
      else
        if new_apdu_rr[s] then
          stream_req_first[s] = f
          stream_relts_req_first[s] = t
          stream_req_last[s] = f
          stream_relts_req_last[s] = t
                
          -- need to do the following just in case we've had a response without a request
          stream_rsp_first[s] = nil
          stream_rsp_last[s] = nil
          stream_relts_rsp_first[s] = nil
          stream_relts_rsp_last[s] = nil
        end
        -- assume this is the last request frame for this APDU
        stream_req_last[s] = f
        stream_relts_req_last[s] = t
      end
    else
      -- This packet is going service to client 
      
      -- If this is a client-side trace we need to ignore service-to-client TCP retransmissions
      -- the rationale being that if we saw the original in the trace the client process saw it too
      if transum.prefs.client_side and retran then
        -- ignore this packet
      else
        if not stream_rsp_first[s] then
          stream_rsp_first[s] = f
          stream_relts_rsp_first[s] = t
          stream_rsp_last[s] = f
          stream_relts_rsp_last[s] = t
        end
        -- assume this is the last response packet for this APDU
        stream_rsp_last[s] = f
        stream_relts_rsp_last[s] = t
      end
    end

    stream_calculation[s] = "SYN and SYN/ACK"

    -- Snapshot the data for the current APDU pair on this stream
    -- We have to do this every time as we don't know when the stream will end
    snapshot(s)
    new_apdu_rr[s] = nil
  end
end

-- This function is called to handle packets detected as Generic UDP
function dissect_gudp(buffer,pinfo,tree)
  return
end

-- This function is called for each packet
-- Wireshark scans all the packets once and then once again as they are displayed
-- The pinfo.visited boolean is set to false on the first scan
function transum.dissector(buffer,pinfo,tree)
  local f = tonumber(pinfo.number)   -- easy access to frame number

  if not pinfo.visited then
  -- if true then
    local detected_protocol = proto_detect(buffer,pinfo,tree)
    -- only run for TCP packets
    if     detected_protocol == "SYN"  then dissect_syn(buffer,pinfo,tree)
    elseif detected_protocol == "MRPC" then dissect_mrpc(buffer,pinfo,tree)
    elseif detected_protocol == "SMB2" then
      if transum.prefs.reassembly then
         dissect_smb2(buffer,pinfo,tree)
      else
         dissect_smb2_nra(buffer,pinfo,tree) -- Call the non-reassembled version
      end
    elseif detected_protocol == "GTCP" then dissect_gtcp(buffer,pinfo,tree)
    elseif detected_protocol == "GUDP" then dissect_gudp(buffer,pinfo,tree)
    end
  end

  -- if there is RTE info associated with this packet we need to output it
  if pinfo.visited then
    local output_flag = 0
    local arr_id = 0
    
    if transum.prefs.rte_on_first_req or transum.prefs.rte_on_last_req or transum.prefs.rte_on_first_rsp or transum.prefs.rte_on_last_rsp then
      if transum.prefs.rte_on_first_req and first_req_to_arr_id[f] then
        arr_id = first_req_to_arr_id[f]
        output_flag = 1
      end 
      if transum.prefs.rte_on_last_req and last_req_to_arr_id[f] then 
        arr_id = last_req_to_arr_id[f]
        output_flag = 1
      end 
      if transum.prefs.rte_on_first_rsp and first_rsp_to_arr_id[f] then 
        arr_id = first_rsp_to_arr_id[f]
        output_flag = 1
      end 
      if transum.prefs.rte_on_last_rsp and last_rsp_to_arr_id[f] then 
        arr_id = last_rsp_to_arr_id[f]
        output_flag = 1
      end 
    else
      if transum.prefs.reassembly and last_req_to_arr_id[f] then
        arr_id = last_req_to_arr_id[f]
        output_flag = 1
      end 
      if not transum.prefs.reassembly and first_req_to_arr_id[f] then 
        arr_id = first_req_to_arr_id[f]
        output_flag = 1
      end 
    end
      
    -- Add the RTE data to the protocol decode tree if we output_flag is set
    if output_flag == 1 then 
      write_rte(arr_id, tree)
    end
  end
end

-- register our protocol as a postdissector
register_postdissector(transum)

transum.prefs.header = Pref.statictext("TRANSUM r9.01b\n\n", "")


-- The handling of retransmissions differs depending on whether the trace is captured
-- for a point adjacent to the client or adjacent to the service.  Default is client-side trace.
transum.prefs.client_side = Pref.bool( "Client side trace", true, "Uncheck this if the trace was captured adjacent to the service" )

-- Some dissectors above need to know in which packet the summary information is presented
-- and this is set in Wireshark with the TCP subdissector reassembly setting.  Unfortunately this TCP
-- preference cannot be read directly and so we must echo it here.  Default is true.
transum.prefs.reassembly = Pref.bool( "Subdissector reassembly enabled", true, "Set this to match to the TCP subdissector reassembly setting" )

-- Create a range preference for the service ports that TRANSUM should process
-- Create a range preference that shows under Foo Protocol's preferences
transum.prefs.ports = Pref.range("Output RTE data for these service ports", "25,80,443,1433", "Add and remove ports numbers separated by commas\nRanges are not supported", 65535)

transum.prefs.gen_clip_filter = Pref.bool( "Generate a trace clip filter (experimental)", false, "Generates a filter term to select all packets for an APDU request-response pair" )

-- The following can be checked to add RTE data to additional packets rather than to the default which depends on the subdissector value
-- (assuming Foo doesn't already have a preference named "bar")
transum.prefs.output_group_heading = Pref.statictext("Check one or more of the following to add RTE data to additional packets", "")
transum.prefs.rte_on_first_req = Pref.bool( "Add RTE data to the first request segment", false, "RTE data will be added to the first request packet" )
transum.prefs.rte_on_last_req = Pref.bool( "Add RTE data to the last request segment", false, "RTE data will be added to the last request packet" )
transum.prefs.rte_on_first_rsp = Pref.bool( "Add RTE data to the first response segment", false, "RTE data will be added to the first response packet" )
transum.prefs.rte_on_last_rsp = Pref.bool( "Add RTE data to the last response segment", false, "RTE data will be added to the last response packet" )

transum.prefs.footer = Pref.statictext("\n\nDeveloped by the TribeLab team at Advance7 - see www.tribelabzero.com/transum", "")
