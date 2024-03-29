---@diagnostic disable: unused-local
-- ========================================================================
--   ______   ___ __ __       _________  ____ ____  ____   ___ ______  _____
-- |      | /  _|  |  |     / ___|    \|    |    \|    \ /  _|      |/ ___/
-- |      |/  [_|  |  |    (   \_|  _  ||  ||  o  |  o  /  [_|      (   \_
-- |_|  |_|    _|_   _|     \__  |  |  ||  ||   _/|   _|    _|_|  |_|\__  |
--   |  | |   [_|     |     /  \ |  |  ||  ||  |  |  | |   [_  |  |  /  \ |
--   |  | |     |  |  |     \    |  |  ||  ||  |  |  | |     | |  |  \    |
--   |__| |_____|__|__|      \___|__|__|____|__|  |__| |_____| |__|   \___|
-- ========================================================================

-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local helper = require("utils.luasnip-helper-func")
local get_visual = helper.get_visual_node
local get_visual_insert = helper.get_visual_insert_node
local tex_utils = helper.tex_utils

--  ╔══════════════════════════════════════════════════════════╗
--  ║                     helper functions                     ║
--  ╚══════════════════════════════════════════════════════════╝

--  ┌                                                          ┐
--  │                    declare variables                     │
--  └                                                          ┘

local full_preamble = {  'packages', 'formatting', 'language-setup', 'newcommands', 'tcolorbox', 'bibliography', 'dynkin' }

local preamble_options = {'packages', 'formatting', 'commands', 'tcolorbox', 'proof',  'language-setup', 'bib', 'dynkin' }

local preamblePath = os.getenv("HOME") .. '/.config/nvim/preamble/'

--  ┌                                                          ┐
--  │                         heppers                          │
--  └                                                          ┘

local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

local function lines_from(file)
  if not file_exists(file) then return {'file "' .. file ..'" DNE'} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end


---@diagnostic disable-next-line: unused-local
local function importLatex(args, parents, user_args)
	if user_args[1] == 'all' then
		user_args = full_preamble
	end
	local value = {}
	for _, word in ipairs(user_args) do
		for _, line in ipairs(lines_from(preamblePath .. word .. '.tex')) do
			table.insert(value, line)
		end
		if word == 'bibliography' then
			table.insert(value, [[]])
			table.insert(value, [[\addbibresource{here}]])
		end
	end
	return value
end


--- comment in preamble to remind user of modular preambles
---@return string
function prambleOptions(_,_)
	local return_val = ''
	for _, word in ipairs(preamble_options) do
		return_val = return_val .. word .. ', '
	end
	return return_val:gsub('[\n\r]', '')
end

return
{
--  ╔══════════════════════════════════════════════════════════╗
--  ║                   type of tex document                   ║
--  ╚══════════════════════════════════════════════════════════╝
	s( -- create book
		{trig = 'book', dscr='create (one-sided) book'},
		fmta([[
		\documentclass[oneside]{book}
		\title{
			\begin{huge}
				\bf{<>}
			\end{huge}
			}
		\author{Nathanael Chwojko-Srawley}

		<>

		%import options: all, <>
		\begin{document}
		\maketitle
		\tableofcontents

		\newpage

		Welcome! New book created on <><>

		%\shipoutAnswer

		\newpage
		%\printbibliography % needs package 'biblatex'
		\end{document}
		]],
		{
			i(1, 'title'),
			i(2),
			f(prambleOptions, {}),
			f(function(_, _) return os.date('%c') end),
			i(0),
		}),
		{
			condition = tex_utils.in_preamble,
			show_condition = tex_utils.in_preamble,
		}
	),
	s(
		{trig = 'article', dscr='create paper (ex. hw, research)'},
		fmta([[
		\documentclass[oneside]{article}
		<>
		\author{Nathanael Chwojko-Srawley}

		<>

		%import options: all, <>
		\begin{document}

		Welcome! New document created on <><>

		\newpage
		%\printbibliography % needs package 'biblatex'
		\end{document}
		]],
		{
			c(1, {
				i(1),
				sn(nil, {
					t({ '\\title{', '\t\\begin{huge}', '\t\t\\bf{' }),
					i(1),
					t({ '}', '\t\\end{huge}', '}' })
				}),
			}),
			i(2),
			f(prambleOptions, {}),
			f(function(_, _) return os.date('%c') end),
			i(0),
		}),
		{
			condition = tex_utils.in_preamble,
			show_condition = tex_utils.in_preamble,
		}
	),
	s( -- for hw
	{trig = 'hw', dscr='create homework (math-focused preamble)'},
		fmta([[
		\documentclass[oneside]{article}
		\author{Nathanael Chwojko-Srawley}
		\title{<>}

		<>

		\begin{document}
		%\maketitle
		\begin{enumerate}
			\item <>
		\end{enumerate}

		\end{document}
		]],
		{
			i(1),
			f(importLatex, {}, {user_args = { { 'packages', 'hw-formatting','newcommands', 'tcolorbox' }}}),
			i(0),
		}),
		{
			condition = tex_utils.in_preamble,
			show_condition = tex_utils.in_preamble,
		}
	),

--  ╔══════════════════════════════════════════════════════════╗
--  ║                 import preamble modules                  ║
--  ╚══════════════════════════════════════════════════════════╝

	s( -- import newcommands and renewcommands
		{trig = 'commands', dscr='import all commands'},
		{
			f(importLatex, {}, {user_args = { { 'newcommands' }}}),
			t({'', '',''})
		},
		{
			condition = tex_utils.in_preamble,
			show_condition = tex_utils.in_preamble,
		}
	),
	s( -- import use-packages (including optional commented)
		{trig = 'packages', dscr='import all packages'},
		{
			f(importLatex, {}, {user_args = { { 'packages' }}}),
			t({'', '',''})
		},
		{
			condition = tex_utils.in_preamble,
			show_condition = tex_utils.in_preamble,
		}
	),
	s( -- import all necessary bibliography packages
		{trig = 'bib', dscr='import bibliography settings'},
		{
			f(importLatex, {}, {user_args = { { 'bibliography'  }}}),
			t({'','', '\\addbibresource{' }), i(1), t('}'),
			t({'', '',''})
		},
		{
			condition = tex_utils.in_preamble,
			show_condition = tex_utils.in_preamble,
		}
	),
	s( -- get preffered book settings (ex. title format, footer,)
		{trig = 'formatting', name ='book settings', dscr='Get preffered book settings'},
		{
			f(importLatex, {}, {user_args = { { 'formatting'  }}}),
			t({'', '',''})
		},
		{
			condition = tex_utils.in_preamble,
			show_condition = tex_utils.in_preamble,
		}
	),
	s( -- get preffered book settings (ex. title format, footer,)
		{trig = 'tcolorbox', name ='tcolorbox Environments', dscr='lem, prop, thm, cor, defn, exercise, answer, Proof, Example'},
		{
			f(importLatex, {}, {user_args = { { 'tcolorbox'  }}}),
			t({'', '',''})
		},
		{
			condition = tex_utils.in_preamble,
			show_condition = tex_utils.in_preamble,
		}
	),
	s( -- language settings (ex. Japanese, Hind, Chinese, etc.)
		{trig = 'languages', name ='language setup', dscr='Devnagari, Hiragana/Katakana/Kanji'},
		{
			f(importLatex, {}, {user_args = { { 'language-setup'  }}}),
			t({'', '',''})
		},
		{
			condition = tex_utils.in_preamble,
			show_condition = tex_utils.in_preamble,
		}
	),
	s( -- just proofs
		{trig = 'proof', name ='Proof environment', dscr='import Proof environment (if no need for thm, defn, etc). "tcolorbox" contains "proof"'},
		{
			f(importLatex, {}, {user_args = { { 'proofs'  }}}),
			t({'', '',''})
		},
		{
			condition = tex_utils.in_preamble,
			show_condition = tex_utils.in_preamble,
		}
	),
	s( -- just dynkin
		{trig = 'dynkin', name ='proof environment', dscr='import dynkin environment'},
		{
			f(importLatex, {}, {user_args = { { 'dynkin' }}}),
			t({'', '',''})
		},
		{
			condition = tex_utils.in_preamble,
			show_condition = tex_utils.in_preamble,
		}
	),
	s( -- import all
		{trig = 'all', 'import all options',dscr='incl. packages, defaults, commands, etc.'},
		{
			f(importLatex, {}, {user_args = { { 'all'  }}}),
			t({'', '',''})
		},
		{
			condition = tex_utils.in_preamble,
			show_condition = tex_utils.in_preamble,
		}
	),
}
