citp_proto = Proto("citp","CITP")

-- revision 12-01-24

-- UDP and TCP Dissector Tables
udp_table = DissectorTable.get("udp.port")
tcp_table = DissectorTable.get("tcp.port")

-- Globals
listeningport = 0
start = 0
count = 0
found_ports = {}
win = nil

ct = {
  -- CITP
  MSEX = "Media Server Extensions",
  PINF = "Peer Information layer",
  PNam = "Peer Name message",
  PLoc = "Peer Location message",
  -- MSEX
  CInf = "Client Information Message",
  SInf = "Server Information Message",
  Nack = "Negative Acknowledge Message",
  LSta = "Layer Status Message",
  StFr = "Stream Frame message",
  RqSt = "Request Stream message",
  GEIn = "Get Element Information message",
  MEIn = "Media Element Information message",
  GETh = "Get Element Thumbnail message",
  EThn = "Element Thumbnail message",
  ELIn = "Element Library Information message",
  GELI = "Get Element Library Information message",
  GELT = "Get Element Library Thumbnail message",
  GVSr = "GetVideoSources",
  VSrc = "Video Sources"
}


function citp_proto.dissector(buffer,pinfo,tree)  
  listeningport = 0
  start = 0
  
  -- Check for buffer lengths less the CITP Header (20 Bytes)
  if buffer:len() < 20 then  -- We don't have enough to figure out message length
    pinfo.desegment_len = 20 - buffer:len() -- get more data.
    return
  end
  
  count = 4
  
  cookie = buffer (start,count):string()
  pinfo.cols.protocol = cookie
  subtree = tree:add(citp_proto,buffer(), string.format("Controller Interface Transport Protocol,  Length: %d Header: 22",buffer:len()))
  start = start + count
  
  count = 1
  citp_version = string.format("%d.%d",buffer (start,count):le_uint(),buffer (start+1,count):le_uint())
  subtree:add(buffer(start,count+1), "Version: " .. citp_version)

  subtree:add(buffer(6,2), "Request/Response ID: " .. buffer(6,2):le_uint())
  message_size = buffer(8,4):le_uint()
  subtree:add(buffer(8,4), "Message Size: " .. message_size)
  subtree:add(buffer(12,2), "Message Part Count: " .. buffer(12,2):le_uint())
  subtree:add(buffer(14,2), "Message Part: " .. buffer(14,2):le_uint())
  
  str = ct[buffer(16,4):string()] or "(Unknown)"
  subtree = subtree:add(buffer(16,4), string.format("Content Type: %s - %s, Length: %d",buffer(16,4):string(),
                                                                            str,
                                                                            string.len(buffer(20):string())))
  pinfo.cols.info = string.format("CITP %s >",citp_version) -- info
  
  -- Calculate message size and reassemble PDUs if needed.
  if message_size > buffer:len() then
    pinfo.desegment_len = message_size - buffer:len()
    return
  end
  
  -- PINF ------------------------------------------------------------------------
  -- Peer Information layer
  if buffer(16,4):string() == "PINF" then
    pinfo.cols.info:append ("PINF >")   -- info
    str = ct[buffer(20,4):string()] or "(Unknown)"
    subtree:add(buffer(20,4), "Content Type: " .. buffer(20,4):string() .. " - " ..str)
    
    -- PNam
    if buffer(20,4):string() == "PNam" then
      start = 26
      count = string.find(buffer(start):string(),"\0",1)
      subtree:add(buffer(start, count),"State: ".. buffer(start):string())
    end
    
    --PLoc
    if buffer(20,4):string() == "PLoc" then
      listeningport = buffer(24,2):le_uint()
      subtree:add(buffer(24,2), "Listening Port: " .. (listeningport))
      
      -- If we listening port is non zero then add to the dissector
      if listeningport then
        CITP_add_port(listeningport)
      end
      listeningport = 0
      
      start = 26
      count = string.find(buffer(start):string(),"\0",1)
      subtree:add(buffer(start, count),"Type: ".. buffer(start):string())
      start = start+count
      
      count = string.find(buffer(start):string(),"\0",1)
      name = buffer(start):string()
      subtree:add(buffer(start, count),"Name: ".. name)
      
      start = start+count
      count = string.find(buffer(start):string(),"\0",1)
      subtree:add(buffer(start, count),"State: ".. buffer(start):string())
    end
    pinfo.cols.info:append (name)   -- info    
  end
  
  -- MSEX ------------------------------------------------------------------------
  if buffer (16,4):string() == "MSEX" then
    local str = ""
    
    str = ct[buffer(22,4):string()] or "(Unknown)"
    
    subtree:add(buffer(20), string.format("Length: %s",buffer:len()-20))
    version = buffer (20,1):uint() .. "." .. buffer(21,1):uint()
    subtree:add(buffer(20,2), "Version: " .. version)  
    subtree:add(buffer(22,4), "Content Type: " .. buffer(22,4):string().." - "..str)
    
    pinfo.cols.info:append ("MSEX ".. version .." >") -- info
    -- MSEX/CInf --------------------------------------------------------------------
    -- Client Information message
    if buffer(22,4):string() == "CInf" then
      pinfo.cols.info:append ("CInf >") -- info
      subtree:add(buffer(26,1), "Supported Version Count: ".. buffer(26,1):uint())
      subtree:add(buffer(27,2), "Supports -NYI-: ".. buffer(27,1))
    end
    
    -- MSEX/SInf 1.2 --------------------------------------------------------------
    -- Server Information message
    if (buffer(22,4):string() == "SInf") and (version <= "1.2") then
      pinfo.cols.info:append ("SInf"..version.." >") -- info
      subtree:add("Version - NYI -")
    end
    
    -- MSEX/SInf 1.0 or 1.1 ---------------------------------------------------------
    -- Server Information message
    if (buffer(22,4):string() == "SInf") and (version <= "1.1") then
      pinfo.cols.info:append ("SInf >") -- info
      start = 26
    
      -- Product Name (ASCII)
      count = 0
      str=""
      while buffer(start+count,1):uint() ~= 0 do
        str = str .. buffer(start+count,1):string()
        count = count + 2
      end
      count = count + 2
      
      subtree:add(buffer(start, count),"Product Name (ASCII): ".. str)
      start = start + count
      
      count = 2
      subtree:add(buffer(start,count), "Version: " .. buffer (start,1):uint() .. "." .. buffer(start+1,1):uint())
      start = start + count
      
      count = 1
      layercount = buffer(start, count):uint()
      dmx = subtree:add(buffer(start,count), "Number of Layers: " .. layercount)
      start = start + count
      
      for i = 1, layercount do
        count = string.find(buffer(start):string(),"\0",1)
        dmx:add(buffer(start, count), "Layer ".. i .." DMX (proto/net/uni/chan.): " .. buffer(start):string())
        start = start + count
      end
      pinfo.cols.info:append (string.format("Server: %s Layers: %d", str, layercount))
    end
    
    -- MSEX/Nack ------------------------------------------------------------------
    -- Negative Acknowledge message
    if buffer(22,4):string() == "Nack" then
      pinfo.cols.info:append ("Nack >") -- info
      subtree:add(buffer(22),"Received Content: " .. buffer(22):string())
    end
    
    -- MSEX/StFr ------------------------------------------------------------------
    -- Stream Frame message
    if buffer(22,4):string() == "StFr" then
      pinfo.cols.info:append ("StFr >") -- info
      start = 26
      
      -- Source ID
      count = 2
      sourceIdentifier = buffer(start,count):le_uint()
      subtree:add(buffer(start,count),"SourceIdentifier: " .. sourceIdentifier)
      start = start + count
      
      -- Thumbs Format
      count = 4
      frameFormat = buffer(start,count):string()      
      subtree:add(buffer(start,count),"FrameFormat:  " .. frameFormat)
      start = start + count
      
      -- Dimentions
      dims, count = MSEX_Dims (buffer, start)
      subtree:add(buffer(start,count), string.format("Dimensions: %s", dims))
      start = start + count
      
      -- Buffer Size
      count = 2
      subtree:add(buffer(start,count),"BufferSize: " .. buffer(start,count):uint())
      bufferSize = buffer(start,count):le_uint()
      start = start + count
      
      pinfo.cols.info:append (string.format("SOURCE:%d %s %s",
                                            sourceIdentifier,
                                            frameFormat,
                                            dims
                                            ))
    end
    
    -- MSEX/RqSt ------------------------------------------------------------------
    -- Request Stream message
    if buffer(22,4):string() == "RqSt" then
      pinfo.cols.info:append ("RqSt >") -- info
      
      start = 26
      
      -- Source ID
      count = 2
      local sourceIdentifier = buffer(start,count):le_uint()
      subtree:add(buffer(start,count),"SourceIdentifier: " .. sourceIdentifier)
      start = start + count
      
      -- Frame Format
      count = 4
      local frameFormat = buffer(start,count):string()
      subtree:add(buffer(start,count),"FrameFormat:  " .. frameFormat)
      start = start + count
      
      -- Dimentions
      dims, count = MSEX_Dims (buffer, start)
      subtree:add(buffer(start,count), string.format("Dimensions: %s", dims))
      start = start + count
      
      -- FPS
      count = 1
      local fps = buffer(start,count):le_uint()
      subtree:add(buffer(start,count),"FPS: " .. fps)
      start = start + count
      
      -- Timeout
      count = 1
      local timeout = buffer(start,count):le_uint()
      subtree:add(buffer(start,count),"Timeout: " .. timeout)
      start = start + count
      
      --info
      pinfo.cols.info:append (string.format("SOURCE:%d %s %s@%d %dSec",
                                            sourceIdentifier,
                                            frameFormat,
                                            dims,
                                            fps,
                                            timeout))
    end
    
    -- MSEX 1.0 - 1.2/EThn ------------------------------------------------------------------
    -- Element Thumbnail message
    if (buffer(22,4):string() == "EThn") and (version <= "1.1") then
      start = 26
      
      -- Library Type
      str, count = MSEX_LibraryType (buffer, start)
      subtree:add(buffer(start,count),string.format("Library Type: %s",str))
      start = start + count
      
      if version == "1.0" then
        count = 1
        libraryNumber = buffer(start,count):le_uint()
        subtree:add(buffer(start,count),"LibraryNumber: " .. libraryNumber)
        start = start + count
      elseif version <= "1.2" then -- There is no definition for 1.2
        -- LibraryID
        libraryNumber, count = MSEX_LibraryID(buffer, start)
        subtree:add(buffer(start,count),string.format("LibraryId: %s", libraryNumber))
        start = start + count
      end
      
      -- Element
      count = 1
      element = buffer(start,count):uint()
      subtree:add(buffer(start,count),string.format("Element: %d", element))
      start = start + count
      
      -- Thumbnail Format
      count = 4
      subtree:add(buffer(start,count),string.format("Thumbnail Format: %s", buffer(start,count):string()))
      start = start + count
      
      -- Dimentions
      dims, count = MSEX_Dims (buffer, start)
      subtree:add(buffer(start,count), string.format("Dimensions: %s", dims))
      start = start + count
      
      --Thumb Buffer
      count = 2
      subtree:add(buffer(start,count),string.format("Thumbs Buffer: %d", buffer(start,count):le_uint()))
      start = start + count
      
      -- Remainder of packet is frame data, or part of frame data
      subtree:add(buffer(start),"Data")
      
        --info
        pinfo.cols.info:append (string.format("ETHn LibraryID:%s Element:%d",
                                              libraryNumber,
                                              element
                                              )
                                )

    end -- end EThn 1.0 - 1.2
    
    -- MSEX 1.0/ELIn ------------------------------------------------------------------
    -- Element Library Information message
    if (buffer(22,4):string() == "ELIn") and (version == "1.0") then
      subtree:add("-NYI-")
    end
    
    -- MSEX 1.1/ELIn ------------------------------------------------------------------
    -- Element Library Information message
    if (buffer(22,4):string() == "ELIn") and (version == "1.1") then
      pinfo.cols.info:append ("ELIn >") -- info
      start = 26
      
      -- Library Type
      str, count = MSEX_LibraryType (buffer, start)
      subtree:add(buffer(start,count),string.format("Library Type: %s",str))
      start = start + count
      
      -- Element Count
      count = 1
      element_count = buffer(start,count):uint()
      element_tree = subtree:add(buffer(start,count),string.format("Element Count: %d", element_count))
      start = start + count
      
      for i = 1, element_count do
        -- LibraryID
        str, count = MSEX_LibraryID(buffer, start)
        lib_tree = element_tree:add(buffer(start,count),string.format("LibraryId: %s", str))
        start = start + count
        
        -- DMX Min
        count = 1
        lib_tree:add(buffer(start,count),string.format("DMX Min: %s", buffer(start,count):uint()))        
        start = start + count
        
        -- DMX Max
        count = 1
        lib_tree:add(buffer(start,count),string.format("DMX Max: %s", buffer(start,count):uint()))        
        start = start + count
        
        count = 0
        str=""
        
        while buffer(start + count,1):uint() ~= 0 do
          str = str .. buffer(start+count,1):string()
          count = count + 2
        end
        count = count + 2
        
        lib_tree:add(buffer(start, count), string.format("Name: %s", str))
        start = start + count
        
        count = 1
        lib_tree:add(buffer(start,count),string.format("Sub Libraries %d", buffer(start,count):uint()))        
        start = start + count
        
        count = 1
        lib_tree:add(buffer(start,count),string.format("Element Count: %d", buffer(start,count):uint()))        
        start = start + count
      end
      pinfo.cols.info:append (string.format("Elements: %d",element_count))
      
    end
    
    -- MSEX 1.2/ELIn ------------------------------------------------------------------
    -- Element Library Information message
    if (buffer(22,4):string() == "ELIn") and (version == "1.2") then
      
    end
    
    -- MSEX/LSta ------------------------------------------------------------------
    -- Layer Status message
    if buffer(22,4):string() == "LSta" then
      pinfo.cols.info:append ("LSta >") -- info
      
      
      start = 26
      
      count = 1
      layercount = buffer(start,count):uint() 
      subtree:add(buffer(start,count), "Layer Count: " .. layercount)
      
      LSta = {}
      LSta_status = {}
      
      for i = 1, layercount do
        start = start + count
        
        count = 1
        LSta[i] = subtree:add(buffer(start,count), "Layer Number:" .. buffer(start,count):uint() .." (".. buffer(start+2,1):uint().."/"..buffer(start+3,1):uint()..")")
        start = start + count
        
        count = 1
        LSta[i]:add(buffer(start,count), "Physical Output: " .. buffer(start,count):uint())
        start = start + count
        
        count = 1
        LSta[i]:add(buffer(start,count), "Media Library: " .. buffer(start,count):uint())
        start = start + count
        
        count = 1
        LSta[i]:add(buffer(start,count), "Media Number: " .. buffer(start,count):uint())
        start = start + count
        
        count = 0
        str=""
        
        while buffer(start+count,1):uint() ~= 0 do
          str = str .. buffer(start+count,1):string()
          count = count + 2
        end
        count = count + 2
        
        LSta[i]:add(buffer(start,count), "Media Name: " .. str)
        start = start + count
        
        count = 4
        length = buffer(start,count):le_uint()
        LSta[i]:add(buffer(start,count), "Media Position: " .. length)
        start = start + count
        
        count = 4
        length = buffer(start,count):le_uint()
        LSta[i]:add(buffer(start,count), "Media Length: " .. length)
        start = start + count
        
        count = 1
        LSta[i]:add(buffer(start,count), "Media FPS: " .. buffer(start,count):uint())
        start = start + count
        
        count = 4
        str = ""
        current_stat = buffer(start+3,1) .. buffer(start+2,1).. buffer(start+1,1).. buffer(start,1)
        
        if bit.band(current_stat,00000001) > 0 then
          str = str .. "MediaPlaying, "
        end
        if bit.band(current_stat,00000002) > 0 then -- 1.2 Only
          str = str .. "MediaPlaybackReverse, "
        end
        if bit.band(current_stat,00000004) > 0 then -- 1.2 Only
          str = str .. "MediaPlaybackLooping, "
        end
        if bit.band(current_stat,00000008) > 0 then -- 1.2 Only
          str = str .. "MediaPlaybackBouncing, "
        end
        if bit.band(current_stat,00000010) > 0 then -- 1.2 Only
          str = str .. "MediaPlaybackRandom, "
        end
        if bit.band(current_stat,00000020) > 0 then -- 1.2 Only
          str = str .. "MediaPaused, "
        end
        if current_stat == "00000000" then
          str = "None, "
        end
        
        str = string.sub(str,1,-3)
        
        LSta[i]:add(buffer(start,count), "Layer Status: ".."("..current_stat..") "..str)
      end -- end for : Layer Count
      --info
      pinfo.cols.info:append (string.format("LAYER COUNT:%d",layercount))
    end -- end if : MSEX/LSta
    
    -- MSEX/MEIn1.0 ------------------------------------------------------------------
    -- Media Element Information message 1.0
    if (buffer(22,4):string() == "MEIn") and (version == "1.0") then
      -- info
      pinfo.cols.info:append (string.format("MEIn >"))
      pinfo.cols.info:append ("-NYI-")
      
    end -- end if: MSEX/MEIn
    
    -- MSEX/MEIn1.1 ------------------------------------------------------------------
    -- Media Element Information message 1.1
    if (buffer(22,4):string() == "MEIn") and (version == "1.1") then
      start = 26
      
      -- LibraryID
      libraryID, count = MSEX_LibraryID(buffer, start)
      subtree:add(buffer(start,count),string.format("LibraryId: %s", str))
      start = start + count
      
      count = 1
      element_count = buffer(start,count):uint()
      MEIn = subtree:add(buffer(start,count),string.format("Element Count: %d", element_count))
      start = start + count
      
      MEIn = {}
      for i = 1, element_count do
        count = 1
        MEIn[i] = subtree:add(buffer(start,count),string.format("Number: %d", buffer(start,count):uint()))
        start = start + count
        
        count = 1
        MEIn[i]:add(buffer(start,count),string.format("DMX Start: %d", buffer(start,count):uint()))
        start = start + count
        
        count = 1
        MEIn[i]:add(buffer(start,count),string.format("DMX End: %d", buffer(start,count):uint()))
        start = start + count
        
        count = 0
        str=""
        while buffer(start + count,1):uint() ~= 0 do --THIS IS BROKEN!?!?!
          str = str .. buffer(start+count,1):string()
          count = count + 2
        end
        count = count +2
        MEIn[i]:add(buffer(start,count),string.format("Name: %s", str))
        start = start + count --debug
        
        -- This is a hack because le_uint64() returns the bigendian result
        count = 8
        epoch = 0
        mult = 1
        
        for j=0, count - 1 do
          epoch = epoch + (buffer(start+j, 1):uint() * mult)
          --debug
          --MEIn[i]:add(buffer(start,count),string.format("%02d: %sx%d=%s", j, buffer(start+j, 1):uint(), mult, buffer(start+j, 1):uint()*mult))  
          mult = mult * 256
        end
        
        -- The time OSX displays and the epoch caluclation is off by a number of minues.
        -- epoch and os.date seem to jive, but OSX time is wrong?
        MEIn[i]:add(buffer(start,count),string.format("Time: %s (epoch:%d)", os.date("%c", epoch), epoch))
        
        start = start + count
        
        -- Dimentions
        dims, count = MSEX_Dims (buffer, start)
        subtree:add(buffer(start,count), string.format("Dimensions: %s", dims))
        start = start + count
        
        count = 4
        MEIn[i]:add(buffer(start,count),string.format("Length (Frames): %d", buffer(start,count):le_uint()))
        start = start + count
        
        count = 1
        MEIn[i]:add(buffer(start,count),string.format("FPS: %d", buffer(start,count):uint()))
        start = start + count
        
      end
      
      
      
      -- info
      pinfo.cols.info:append (string.format("MEIn LibraryID: %s Elements: %d",libraryID ,element_count))
    end -- end if: MSEX/MEIn
    
    -- MSEX/GEIn1.0 ------------------------------------------------------------------
    -- Get Element Information message 1.0
    if (buffer(22,4):string() == "GEIn") and (version == "1.0") then
      start = 26
      
      -- Library Type
      str, count = MSEX_LibraryType (buffer, start)
      subtree:add(buffer(start,count),string.format("Library Type: %s",str))
      start = start + count
      
      count = 1
      local libraryNumber = buffer(start,count):le_uint()
      subtree:add(buffer(start,count),"LibraryNumber: " .. libraryNumber)
      start = start + count
      
      count = 1
      local elementCount = buffer(start,count):le_uint()
      subtree:add(buffer(start,count),"Element Count: " .. elementCount)
      start = start + count
      
      count = 1
      local elementNumbers = buffer(start,count):le_uint()
      subtree:add(buffer(start,count),"Element Numbers: " .. elementNumbers)
      start = start + count
      
      
      -- info
      pinfo.cols.info:append (string.format("GEIn >"))
    end -- end if: MSEX/MEIn
    
    
    -- MSEX/GEIn1.1 ------------------------------------------------------------------
    -- Get Element Information message 1.1
    if (buffer(22,4):string() == "GEIn") and (version == "1.1") then
      start = 26
      
      -- Library Type
      str, count = MSEX_LibraryType (buffer, start)
      subtree:add(buffer(start,count),string.format("Library Type: %s",str))
      start = start + count
      
      -- LibraryID
      str, count = MSEX_LibraryID(buffer, start)
      subtree:add(buffer(start,count),string.format("LibraryId: %s", str))
      start = start + count
      
      count = 1
      elementCount = buffer(start,count):le_uint()
      subtree:add(buffer(start,count),"ElementCount: " .. elementCount)
      start = start + count
      
      if (elementCount > 0) then
        count = 1
        for i = 1, elementCount do
          elements:add(buffer(start,count),"Element Number: %d" .. buffer(start,count):le_uint())
          start = start + count
        end
      end
      
      -- info
      pinfo.cols.info:append (string.format("GEIn LibraryID: %s Count: %d", str, elementCount))
    end -- end if: MSEX/GEIn1.1
    
    -- MSEX/GELI1.0 ------------------------------------------------------------------
    -- Get Element Library Information message 1.0
    if (buffer(22,4):string() == "GELI") and (version == "1.0") then
      start = 26
      
      -- Library Type
      str, count = MSEX_LibraryType (buffer, start)
      subtree:add(buffer(start,count),string.format("Library Type: %s",str))
      start = start + count
      
      count = 1
      libraryCount = buffer(start,count):uint()
      subtree:add(buffer(start,count),string.format("Library Count: %d", libraryCount))
      start = start + count
      
      if (libraryCount > 0) then
        count = 1
        for i = 1, libraryCount do
          elements:add(buffer(start,count),"Element Number: %d" .. buffer(start,count):le_uint())
          start = start + count
        end
      end
      
      -- info
      pinfo.cols.info:append (string.format("GELI LibraryID: %s Count:%d", libraryId, libraryCount))
    end -- end if: MSEX/GELI1.0
    
    -- MSEX/GELI1.1 ------------------------------------------------------------------
    -- Get Element Library Information message 1.1
    if (buffer(22,4):string() == "GELI") and (version == "1.1") then
      start = 26
      
      -- Library Type
      str, count = MSEX_LibraryType (buffer, start)
      subtree:add(buffer(start,count),string.format("Library Type: %s",str))
      start = start + count
      
      -- LibraryID
      str, count = MSEX_LibraryID(buffer, start)
      subtree:add(buffer(start,count),string.format("LibraryId: %s", str))
      start = start + count
      
      count = 1
      libraryCount = buffer(start,count):uint()
      if libraryCount == 0 then
        txt = "All"
        else
        txt = ""
      end
      elements = subtree:add(buffer(start,count),string.format("Library Count: (%d) %s", libraryCount, txt))
      start = start + count
      
      if (libraryCount > 0) then
        count = 1
        for i = 1, libraryCount do
          elements:add(buffer(start,count),"Library Number: " .. buffer(start,count):le_uint())
          start = start + count
        end
      end
      -- info
      pinfo.cols.info:append (string.format("GELI LibraryID: %s Count: %s (%d)", str, txt, libraryCount))
    end -- end if: MSEX/GELI1.1
    
    -- MSEX/GELT 1.0 & 1.1 ------------------------------------------------------------------
    -- Get Element Library Thumbnail message 1.0
    if (buffer(22,4):string() == "GELT") and ((version == "1.0") or (version == "1.1")) then
      start = 26
      
      -- Thumbnail Format
      count = 4
      thumbnailFormat = buffer(start,count):string()
      subtree:add(buffer(start,count),string.format("Thumbnail Format: %s", thumbnailFormat))
      start = start + count
      
      -- Dimentions
      dims, count = MSEX_Dims (buffer, start)
      subtree:add(buffer(start,count), string.format("Dimensions: %s", dims))
      start = start + count
      
      -- Thumbnail Flags
      count = 1
      str = ""
      current_stat = buffer(start,count):uint()
      
      if bit.band(current_stat,00000001) > 0 then
        str = str .. "Preserve aspect ratio, "
      end
      if current_stat == "00000000" then
        str = "None, "
      end        
      str = string.sub(str,1,-3) -- strip off the final ", "
      
      subtree:add(buffer(start,count), "Thumbnail Flags: ".."("..current_stat..") "..str)
      
      -- Library Type
      str, count = MSEX_LibraryType (buffer, start)
      subtree:add(buffer(start,count),string.format("Library Type: %s",str))
      start = start + count
      
      -- LibraryCount
      count = 1
      LibraryCount = buffer(start, count):uint()
      elements = subtree:add(buffer(start, count), string.format("Library Count: %d", LibraryCount))
      start = start + count
      
      if (LibraryCount > 0) then
        if (version == "1.0") then
          -- Library Numbers
          count = 1
          for i = 1, LibraryCount do
            elements:add(buffer(start,count),"Library Numbers: %d" .. buffer(start,count):le_uint())
            start = start + count
          end
          else
          -- LibraryID
          count = 1
          for i = 1, LibraryCount do
            str, count = MSEX_LibraryID (buffer, start)
            elements:add(buffer(start,count),string.format("Library ID: %s", str))
            start = start + count
          end
        end
      end
      
      -- info
      pinfo.cols.info:append (string.format("GELT %s %s Count: %d",
                                            thumbnailFormat,
                                            dims,
                                            LibraryCount)
                              )
    end -- end if: MSEX/GELT1.0 / 1.1
    
    
    -- MSEX/GETh 1.0 & 1.1 -------------------------------------------------------------
    -- Get Element Get Element Thumbnail message 1.0 & 1.1
    if (buffer(22,4):string() == "GETh") and ((version == "1.0") or (version == "1.1")) then
      start = 26
      
      -- Thumbnail Format
      count = 4
      thumbnailFormat = buffer(start,count):string()
      subtree:add(buffer(start,count), string.format("Thumbnail Format: %s", thumbnailFormat))
      start = start + count
      
      -- Width x Height
      dims, count = MSEX_Dims (buffer, start)
      subtree:add(buffer(start,count), string.format("Dimensions: %s", dims))
      start = start + count
      
      -- Thumbnail Flags
      count = 1
      str = ""
      current_stat = buffer(start,count):uint()
      
      if bit.band(current_stat,00000001) > 0 then
        str = str .. "Preserve aspect ratio, "
      end
      if current_stat == "00000000" then
        str = "None, "
      end        
      str = string.sub(str,1,-3) -- strip off the final ", "
      subtree:add(buffer(start,count), "Thumbnail Flags: ".."("..current_stat..") "..str)
      start = start +1
      
      -- Library Type
      str, count = MSEX_LibraryType (buffer, start)
      subtree:add(buffer(start,count),string.format("Library Type: %s",str))
      start = start + count
      
      if version == "1.0" then
        -- Library Numbers
        count = 1
        subtree:add(buffer(start,count),"Library Numbers: %d" .. buffer(start,count):le_uint())
        start = start + count
        -- TODO
        
        elseif version == "1.1" then
        -- LibraryID
        LibraryID, count = MSEX_LibraryID (buffer, start)
        subtree:add(buffer(start,count),string.format("Library ID: %s", LibraryID))
        start = start + count
        
        -- Element Count
        count = 1
        element_count = buffer(start,count):le_uint()
        element_tree = subtree:add(buffer(start,count),string.format("Element Count: %d", element_count))
        start = start + count
        
        -- Element Numbers
        for i = 1, element_count do
          -- LibraryID
          element = buffer(start,count):uint()
          element_tree:add(buffer(start,count),string.format("Element Number: %s", element))
          start = start + count
        end
        -- info
        pinfo.cols.info:append (string.format("GETh %s %s LibraryID: %s Count: %d",
                                              thumbnailFormat,
                                              dims,
                                              LibraryID, 
                                              element_count)
                                )

      end
      
    end -- end if: MSEX/GEThT1.0 & 1.1
    
    -- MSEX/GVSr -------------------------------------------------------------
    -- GetVideoSources
    if (buffer(22,4):string() == "GVSr")then
        pinfo.cols.info:append (string.format("GVSr"))
    end -- end if: MSEX/GVSr

    -- MSEX/VSrc -------------------------------------------------------------
    -- Video Sources
    if (buffer(22,4):string() == "VSrc")then
      start = 26
      
      -- Source Count
      count = 2
      sourceCount = buffer(start,count):le_uint()
      subtree:add(buffer(start,count), string.format("Source Count: %d", sourceCount))
      start = start + count
      
      -- Source Info
       source = {}
      for i = 1, sourceCount do
        -- SourceID
        count = 2
        sourceID = buffer(start,count):le_uint()
        source[i] = subtree:add(buffer(start,count), string.format("SourceID: %d", sourceID))
        start = start + count
        
        -- Source Name
        str, count = ucs2ascii(start, buffer) -- convert the usc2 to faux ASCII
        source[i]:add(buffer(start,count), string.format("Name: %s", str))
        start = start + count
        
        -- Physical Output
        count = 1
        if buffer(start,count):le_uint() < 255 then
          str = buffer(start,count):le_uint()
        else
          str = "(NONE)"
        end
        source[i]:add(buffer(start,count), string.format("Physical Out: %s",str))
        start = start + count

        -- Layer Number
        count = 1
        if buffer(start,count):le_uint() < 255 then
          str = buffer(start,count):le_uint()
        else
          str = "(NONE)"
        end
        source[i]:add(buffer(start,count), string.format("Layer Number: %s",str))
        start = start + count

        -- Flags
        count = 2
        str = ""
        current_stat = buffer(start,count):le_uint()
      
        if bit.band(current_stat,00000001) > 0 then
          str = str .. "Without effects, "
        end
        if current_stat == 0 then
          str = "None, "
        end        
      str = string.sub(str,1,-3) -- strip off the final ", "
      
      source[i]:add(buffer(start,count), string.format("Flags: %s",str))
      start = start + count
      
      -- Width x Height
      dim, count = MSEX_Dims (buffer, start)
      source[i]:add(buffer(start,count), string.format("Dimensions: %s",dim)) 
      start = start + count
      

      end
      
      pinfo.cols.info:append (string.format("VSrc"))
    end -- end if: MSEX/VSrc
    
  end -- end if : MSEX
  
end -- end function citp_proto.dissector





-- ---------------------------------------------------------------------
-- Formatters
-- ---------------------------------------------------------------------

-- u2 to ascii
function ucs2ascii(start, buffer)
  count = 0
  str=""
  while buffer(start+count,1):uint() ~= 0 do
    str = str .. buffer(start+count,1):string()
    count = count + 2
  end
  count = count + 2

  return str, count
end

-- MSEX_LibraryID formatter
function MSEX_LibraryID (buffer, start)
  str = string.format("%d,%d,%d,%d", 
                      buffer(start,1):uint(),
                      buffer(start+1,1):uint(),
                      buffer(start+2,1):uint(),
                      buffer(start+3,1):uint()
                      )
  return str, 4 --string, count
end

-- MSEX_Dims formatter
function MSEX_Dims (buffer, start)
  -- Width
  count = 2
  width = buffer(start,count):le_uint()
  
  -- Height
  height = buffer(start+2,count):le_uint()
  
  -- Width x Height
  count = 4
  str = string.format("%dx%d", width, height)
  start = start + count
  return str, 4 --string, count
end

-- MSEX_LibraryType formatter
function MSEX_LibraryType (buffer, start)
  libraryType = buffer(start,1):le_uint()
  if     (libraryType == 1) then libraryType_name = "Media"
    elseif (libraryType == 2) then libraryType_name = "Effects"
  end
  str = string.format("(%d) %s",libraryType,libraryType_name)
  
  return str, 1 -- string, count
end

-- Add TCP Port
-- port is based in PINF listen port
function CITP_add_port (port)
  if port > 0 then
    if not found_ports [port] then
      found_ports [port] = true
      tcp_table:add (port,citp_proto)
      win_log = string.format("Added CITP Port: %d\n", port)
      if win == nil then
        win = TextWindow.new("CITP Log")
      end

      win:append(win_log)
      win_log = ""
    end
  end
end


-- always using UDP 4809
udp_table:add(4809,citp_proto)

--Debug, Add Mbox
--CITP_add_port(6436) -- PRG Mbox
--CITP_add_port(4011) -- Arkaos Media Master





