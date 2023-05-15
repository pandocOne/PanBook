--- https://pandoc.org/lua-filters.html#replacing-placeholders-with-their-metadata-value

local vars = {}
--- pandoc.utils = require 'pandoc.utils'

function get_vars (meta)
  for k, v in pairs(meta) do
     if pandoc.utils.type(v) == 'Inlines' then
        vars["%" .. k .. "%"] = {table.unpack(v)}
     end
  end
end

function replace (el)
  if vars[el.text] then
    return pandoc.Span(vars[el.text])
  else
    return el
  end
end

return {{Meta = get_vars}, {Str = replace}}

