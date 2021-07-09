local ls = require("luasnip")
-- some shorthands...
local snippet = ls.snippet
local snip = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local fn = ls.function_node
local choice = ls.choice_node
local dyn = ls.dynamic_node

-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function copy(args)
  return args[1]
end

-- These three functions from
-- https://github.com/tbastos/lift/blob/454a6a06b696022dbdbd1f6d8e8a1789fc4d6a4f/lift/string.lua#L19
-- The MIT License (MIT)

-- Copyright (c) 2014 Thiago Bastos.

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
local function capitalize(str)
  return (string.gsub(str, '^%l', string.upper))
end

-- Returns the UpperCamelCase form of a string
local function classify(str)
  return (string.gsub(str, '%W*(%w+)', capitalize))
end

local function split(str, delimiters)
  return string.gmatch(str, '([^'..delimiters..']+)['..delimiters..']*')
end

----

local function types_to_names(args)
  local types = args[1]
  if types == nil then
    return {}
  end

  local names = {}
  for i, ty in ipairs(types) do
    local parts = {}
    for w in split(ty, ",") do
      table.insert(parts, classify(w))
    end
    names[i] = table.concat(parts, ", ")
  end
  return names
end

ls.snippets = {
  mercury = {
    snippet("pred", {
      -- Simple static text.
      text(":- pred "),
      insert(1), -- pred name
      text("("),
      insert(2), -- params
      text({ ").", ":- mode " }),
      fn(copy, 1),
      text("("),
      insert(3),
      text(") is "),
      choice(4, { text("det"), text("semidet") }),
      text({".", "", ""}),
      fn(copy, 1),
      text("("),
      fn(types_to_names, 2), -- modes
      text({") :-", "\t"}),
      -- Last Placeholder, exit Point of the snippet. EVERY 'outer' SNIPPET NEEDS Placeholder 0.
      insert(0),
      text("."),
    }),
  }
}
