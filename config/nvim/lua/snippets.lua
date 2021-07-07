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

local function ucfirst(str)
  local spl = string.split(str, " ") -- FIXME: split isn't a thing
  for i,v in pairs(spl) do
      spl[i] = v:sub(1,1):upper() .. v:sub(2)
  end
  return table.concat(spl, " ")
end

ls.snippets = {
  mercury = {
    snippet("pred", {
      -- Simple static text.
      text(":- pred "),
      insert(1),
      text("("),
      insert(2),
      text({ ").", ":- mode " }),
      fn(copy, 1),
      text("("),
      insert(4),
      text(") is "),
      choice(3, { text("det"), text("semidet") }),
      text({".", "", ""}),
      fn(copy, 1),
      text("("),
      fn(copy, 2),
      text({") :-", "\t"}),

      -- function, first parameter is the function, second the Placeholders
      -- whose text it gets as input.
      -- fn(copy, 2),
      -- text({ "", "function " }),
      -- -- Placeholder/Insert.
      -- insert(1),
      -- text("("),
      -- -- Placeholder with initial text.
      -- insert(2, "int foo"),
      -- -- Linebreak
      -- text({ ") {", "\t" }),
      -- Last Placeholder, exit Point of the snippet. EVERY 'outer' SNIPPET NEEDS Placeholder 0.
      insert(0),
      text("."),
    }),
  }
}
