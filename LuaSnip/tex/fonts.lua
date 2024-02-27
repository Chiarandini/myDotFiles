--  ┌                                                          ┐
--  │                     manual triggers                      │
--  └                                                          ┘
---@diagnostic disable: undefined-global, unused-local
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
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local helper = require("utils.luasnip-helper-func")
local get_visual = helper.get_visual_node
local get_visual_insert = helper.get_visual_insert_node
local tex_utils = helper.tex_utils

-- may still be useful in the future: /Users/nathanaelchwojko-srawkey/Library/Group Containers/UBF8T346G9.OneDriveSyncClientSuite/OneDrive.noindex/OneDrive/Documents

-- ┌───────────────────────────────┐
-- │ For Further Inspiration, see: │
-- └───────────────────────────────┘
-- https://castel.dev/post/lecture-notes-1/

return
--  ┌                                                          ┐
--  │                     manual triggers                      │
--  └                                                          ┘
	{
		-- emph
		s(
			{ trig = "i", wordTrig = true, name = 'italic'},
			fmta("\\emph{<>}", {
				d(1, get_visual),
			})		),
		-- bold
		s(
			{ trig = "b", wordTrig = true, name = 'bold'},
			fmta("\\textbf{<>}", {
				d(1, get_visual),
			})		),
		-- bold-italic
		s(
			{ trig = "bi",  wordTrig = true, name = 'bold-italic'},
			fmta("\\textbf{\\emph{<>}}", {
				d(1, get_visual),
			})		),
		-- italic-bold
		s(
			{ trig = "ib", wordTrig = true, name = 'italic-bold'},
			fmta("\\emph{\\textbf{<>}}", {
				d(1, get_visual),
			})		),
		-- foot-note
		s(
			{ trig = "fn",  wordTrig = false, name = 'footnote', },
			fmta("\\footnote{<>}", {
				d(1, get_visual),
			})		),
		-- quotation
		-- s(
		-- 	{trig = '`', name = 'quotation'},
		-- 	{ t('``'), d(1, get_visual_insert), t("''") },
		-- 	{
		-- 		condition = tex_utils.in_text,
		-- 		show_condition = tex_utils.in_text,
		-- 	}
		-- ),
		--  ┌                                                          ┐
		--  │                                                          │
		--  │               regular expression triggers                │
		--  │                                                          │
		--  └                                                          ┘
	},
	--  ┌                                                          ┐
	--  │                                                          │
	--  │                      --autotriggers                      │
	--  │                                                          │
	--  └                                                          ┘
	{
		s(
			{trig = '``', name = 'quotation'},
			{ t('``'), d(1, get_visual_insert), t("''") },
			{
				condition = tex_utils.in_text,
				show_condition = tex_utils.in_text,
			}
		),
		-- TODO: make it not activate if the whole word is capitalized
		s(
			{trig = "([A-Z])([A-Z])(%a+) ", regTrig='true', name = 'un-capitalize', dscr='acidentally capitalized two letters'},
			{
				f(function(_, snip) return snip.captures[1] end),
				f(function(_, snip) return string.lower(snip.captures[2]) end),
				f(function(_, snip) return snip.captures[3] end),
				t(' ')
			}		)
	}
