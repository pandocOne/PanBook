--- include-code-files.lua – filter to include code from source files
---
--- Copyright: © 2020 Bruno BEAUFILS
--- License:   MIT – see LICENSE file for details

--- Dedent a line
local function dedent (line, n)
  return line:sub(1,n):gsub(" ","") .. line:sub(n+1)
end

--- Filter function for code blocks
local function transclude (cb)
  if cb.attributes.include then
    local curl_path = os.getenv("CURL") or "curl"
    local tmpfile = os.tmpname()
    local fn=cb.attributes.include
    if fn == "code" then
      for line in cb.text:gmatch('[^\n]+') do
        if line:sub(1,2) ~= '//' then
          fn = line
          break
        end
      end
    end
    if string.sub(fn,1,1) == "~" then
      fn = os.getenv("HOME")..string.sub(fn,2)
    elseif (string.sub(fn,1,7) == "http://") or (string.sub(fn,1,8) == "https://") then
      local cmd=curl_path and curl_path .. ' -s --insecure ' .. fn .. ' -o ' .. tmpfile
      os.execute(cmd)
      -- os.execute('curl -s --insecure ' .. fn .. ' -o /data/' .. string.sub(tmpfile,6))
      fn = tmpfile
    end
    local content = ""
    local fh = io.open(fn)
    if not fh then
      io.stderr:write("Cannot open file " .. fn .. " | Skipping includes\n")
    else
      local number = 1
      local start = 1

      -- change hyphenated attributes to PascalCase
      for i,pascal in pairs({"startLine", "endLine"})
      do
         local hyphen = pascal:gsub("%u", "-%0"):lower()
         if cb.attributes[hyphen] then
            cb.attributes[pascal] = cb.attributes[hyphen]
            cb.attributes[hyphen] = nil
         end
      end

      if cb.attributes.startLine then
        cb.attributes.startFrom = cb.attributes.startLine
        start = tonumber(cb.attributes.startLine)
      end
      for line in fh:lines ("L")
      do
        if cb.attributes.dedent then
          line = dedent(line, cb.attributes.dedent)
        end
        if number >= start then
          if not cb.attributes.endLine or number <= tonumber(cb.attributes.endLine) then
            content = content .. line
          end
        end
        number = number + 1
      end 
      fh:close()
    end     
    -- remove key-value pair for used keys
    cb.attributes.include = nil
    cb.attributes.startLine = nil
    cb.attributes.endLine = nil
    cb.attributes.dedent = nil
    -- return final code block
    return pandoc.CodeBlock(content, cb.attr)
  end
end

return {
  { CodeBlock = transclude }
}
