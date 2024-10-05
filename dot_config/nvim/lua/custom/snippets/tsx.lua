-- clear snippets
require("luasnip.session.snippet_collection").clear_snippets("typescriptreact")

local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

local function capitalize(args)
  return args[1][1]:gsub("^%l", string.upper)
end

-- TODO: Setup snippets properly
ls.add_snippets("all", {
  s("hi", {
    t("Hello, world!"),
  }),
  s("ternary", {
    -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    i(1, "cond"),
    t(" ? "),
    i(2, "then"),
    t(" : "),
    i(3, "else"),
  }),
})

ls.add_snippets("typescriptreact", {
  s(
    "rfz",
    fmt(
      [[
import React from 'react';

interface {Name}Props {{
    {props}
}}

const {Name}: React.FC<{Name}Props> = ({{ {prop_values} }}) => {{
    return (
        <div>
            {body}
        </div>
    );
}};

export default {Name};
]],
      {
        Name = f(capitalize, { 1 }),
        props = i(2, "// define props here"),
        prop_values = i(3, "props"),
        body = i(0),
      }
    )
  ),
})

-- local ls = require("luasnip")
-- local s = ls.snippet
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local fmt = require("luasnip.extras.fmt").fmt
-- local rep = require("luasnip.extras").rep
--
-- -- Function to capitalize the first letter
-- local function capitalize(args)
-- 	return args[1][1]:gsub("^%l", string.upper)
-- end
--
-- -- Define the React TypeScript Functional Component snippet
-- local react_ts_component = s(
-- 	"rfc",
-- 	fmt(
-- 		[[
-- import React from 'react';
--
-- interface {Name}Props {{
--     {props}
-- }}
--
-- const {Name}: React.FC<{Name}Props> = ({{ {prop_values} }}) => {{
--     return (
--         <div>
--             {body}
--         </div>
--     );
-- }};
--
-- export default {Name};
-- ]],
-- 		{
-- 			Name = f(capitalize, { 1 }),
-- 			props = i(2, "// define props here"),
-- 			prop_values = i(3, "props"),
-- 			body = i(0),
-- 		}
-- 	)
-- )
--
-- return {
-- 	react_ts_component,
-- }
