--  ╔══════════════════════════════════════════════════════════╗
--  ║                                                          ║
--  ║                       lsp setup                          ║
--  ║                                                          ║
--  ╚══════════════════════════════════════════════════════════╝

-- declare variable
local lspconfig = require("lspconfig")
local mason = require("mason")
local masonLspConfig = require("mason-lspconfig")
local null_ls = require("null-ls")
local icons = require('utils.icons')
-- local lspSaga = require('lspsaga')

-- ======================================
-- mason setup (required before lspconfig)
-- ======================================

mason.setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	-- log_level = vim.log.levels.DEBUG
})

-- required before lsp setup
masonLspConfig.setup({
	ensure_installed = {
		"eslint",
		"jsonls",
		"lua_ls",
		-- "black",
		-- "mypy",
		-- "ruff",
		-- "pyright",
		-- "ruff_lsp",
		"tsserver",
		"vimls",
	},
})

require("mason-nvim-dap").setup({
	ensure_installed = { "delve", "debugpy", "node2" },
})

-- =============
-- null-ls setup
-- =============

--
null_ls.setup()

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "spell", 'bibclean'},
	handlers = {
		function() end, -- disables automatic setup of all null-ls sources
		---@diagnostic disable-next-line: unused-local
		stylua = function(source_name, methods)
			null_ls.register(null_ls.builtins.formatting.stylua)
		end,
		bibclean = function(source_name, methods)
			null_ls.register(null_ls.builtins.formatting.bibclean) end,
		shfmt = function(source_name, methods) -- custom logic
			require("mason-null-ls").default_setup(source_name, methods) -- to maintain default behavior
		end,
		-- mypy = function(source_name, methods)
		-- 	null_ls.register(null_ls.builtins.diagnostics.mypy)
		-- end,
		-- ruff = function(source_name, methods)
		-- 	null_ls.register(null_ls.builtins.diagnostics.ruff)
		-- end,
		-- black = function(source_name, methods)
		-- 	null_ls.register(null_ls.builtins.formatting.black)
		-- end,
	},
})

--  ┌                                                          ┐
--  │                            --                            │
--  │                on_attach and capabilities                │
--  │                            --                            │
--  └                                                          ┘

-- setup shortcuts for when attaching to buffer
---@diagnostic disable-next-line: unused-local
local lsp_attach = function(client, bufnr) local opts = { buffer = bufnr, remap = false }


	local function optsDesc(description)
		-- wrap the description with desired defaults
		return { buffer = bufnr, remap = false, desc = description }
	end

	vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", optsDesc("next [d]iagnostic"))
	vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", optsDesc("previous [d]idagnostic"))

	-- null-ls configuration
	vim.keymap.set("n", "<Leader>ff", function()
		vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
	end, { buffer = bufnr, desc = "[lsp] format" })
	vim.keymap.set("x", "<Leader>ff", function()
		vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
	end, { buffer = bufnr, desc = "[lsp] format" })

	-- TODO: check for if noice is downloaded.
      -- vim.keymap.set({"n", "i", "s"}, "<c-f>", function()
      --   if not require("noice.lsp").scroll(4) then
      --     return "<c-f>"
      --   end
      -- end, { silent = true, expr = true })

      -- vim.keymap.set({"n", "i", "s"}, "<c-b>", function()
      --   if not require("noice.lsp").scroll(-4) then
      --     return "<c-b>"
      --   end
      -- end, { silent = true, expr = true })

	-- vim.keymap.set("n", "L", function() vim.lsp.buf.hover() end, optsDesc('hover help'))
	-- vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", optsDesc("[g]o to [d]efinition"))
	-- vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, optsDesc("[g]o to [D]ecleration"))
	-- vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, optsDesc("[g]o to [i]mplementation"))
	-- -- vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<cr>", optsDesc("[g]et [r]eferenfces"))
	-- vim.keymap.set("n", "gr", require'lspsaga'.lsp_finder, optsDesc('[g]et [r]eferenfces'))
	-- vim.keymap.set("n", "L", "<cmd>Lspsaga hover_doc<cr>", optsDesc("hover help"))
	-- vim.keymap.set("n", "<F1>", function() vim.lsp.buf.code_action() end, optsDesc("fuzzy code action"))
	-- vim.keymap.set("x", "<F1>", function() vim.lsp.buf.range_code_action() end, opts)
	-- vim.keymap.set("n", "<F2>", "<cmd>Lspsaga rename<cr>", optsDesc("rename"))
	-- vim.keymap.set("n", "<F3>", "<cmd>Lspsaga code_action<cr>", optsDesc("preview code action"))

	-- NOTE: this is reprogramming gt [:tabNext]
	-- vim.keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<cr>", optsDesc("[g]o to [t]ype"))
	-- vim.keymap.set("n", "gpt", "<cmd>Lspsaga peek_type_definition<cr>", optsDesc("[p]eek [t]ype"))
	-- vim.keymap.set("n", "gpd", "<cmd>Lspsaga peek_definition<cr>", optsDesc("[p]eak [d]efinition"))
	vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, optsDesc("[s]ignature help"))
	-- vim.keymap.set("n", "gw", "<cmd>Lspsaga outline<cr>", optsDesc("[g]et [w]orkspace symbols"))
	vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, optsDesc("diagnostics float"))
	-- vim.keymap.set("n", "gic", "<cmd>Lspsaga incoming_calls<cr>", optsDesc("[g]et [i]incoming [c]alls"))
	-- vim.keymap.set("n", "goc", "<cmd>Lspsaga outgoing_calls<cr>", optsDesc("[g]et [o]utgoing [c]alls"))
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, optsDesc("signature [h]elp"))
	-- vim.keymap.set("n", "<c-s><c-d>", "<cmd>Lspsaga show_buf_diagnostics<cr>", optsDesc(" buffer Diagnostics"))
	vim.keymap.set("n", 'go', "<cmd>SymbolsOutline<cr>", optsDesc("get [o]outline"))
	vim.keymap.set("n", '<c-s>o', "<cmd>SymbolsOutline<cr>", optsDesc("get [o]outline"))


	-- vim.keymap.set("n", "L", function() vim.lsp.buf.hover() end, optsDesc('hover help'))
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, optsDesc('[g]o to [d]efinition'))
	vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, optsDesc('[g]o to [D]ecleration'))
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, optsDesc('[g]o to [i]mplementation'))
	vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, optsDesc('[g]et [r]eferenfces'))
	-- vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, optsDesc('[g]o to type definition'))
	vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, optsDesc('[s]ignature help'))
	vim.keymap.set("n", "gw", function() vim.lsp.buf.workspace_symbol('') end, optsDesc('[g]et [w]orkspace symbols'))
	vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, optsDesc('diagnostics help'))
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, optsDesc('next [d]iagnostic'))
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, optsDesc('previous [d]idagnostic'))
	vim.keymap.set("n", "<F1>", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<F4>", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set('x', '<F1>', function () vim.lsp.buf.range_code_action() end, opts)
	vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, optsDesc('signature [h]elp'))
end

-- configure capabilities
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
--enable folding
lsp_capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

--  for ltex add words to dictionary via zg
local words = {}
for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8.add", "r"):lines() do
	table.insert(words, word)
end
local ltexConfig = {
	--	dictionary = {
	--	  ['en-US'] = words,
	--	},
	-- table <string> : languages for witch dictionaries will be loaded, e.g. { "es-AR", "en-US" }
	-- https://valentjn.github.io/ltex/supported-languages.html#natural-languages
	load_langs = { "en-US" }, -- en-US as default
	-- boolean : whether to load dictionaries on startup
	init_check = true,
	-- string : relative or absolute paths to store dictionaries
	-- e.g. subfolder in current working directory: ".ltex"
	-- e.g. shared files for all projects :  vim.fn.expand("~") .. "/.local/share/ltex"
	path = vim.fn.expand("~") .. "/.local/share/ltex/", -- current working directory
	-- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
	log_level = "none",
	-- log_level = "debug",
	-- table : configurations of the ltex language server.
	-- Only if you are calling the server from ltex_extra
	-- server_opts = nil,
	-- to not scan too often (esp. my huge files)
	checkFrequency = "save",
}

--  ┌                                                          ┐
--  │                            --                            │
--  │                      configure lsp                       │
--  │                            --                            │
--  └                                                          ┘

local handlers = {
	function(server)
		require("lspconfig")[server].setup({
			capabilities = lsp_capabilities,
			on_attach = lsp_attach,
		})
	end,
	-- ==================
	--      lua_ls
	-- ==================
	---- https://luals.github.io/wiki/settings/
	lua_ls = function()
		lspconfig.lua_ls.setup({
			on_attach = lsp_attach,
			capabilities = lsp_capabilities,
			settings = {
				Lua = {
					completion = {
						callSnippet = "Both", -- Replace
					},
					diagnostics = {
						-- TODO: missing-fields for some reason is overboard
						disable = { "incomplete-signature-doc", "missing-fields" },
						-- Get the language server to recognize the `vim` global
						globals = { "MiniMap" },
					},
					hint = {
						enable = true,
						arrayIndex = "Disable",
					},
					telemetry = { enable = false },
					workspace = {
						checkThirdParty = false,
						library = {
							-- Make the server aware of Neovim runtime files
							-- vim.fn.expand('$VIMRUNTIME/lua'),
							-- vim.fn.stdpath('config') .. '/lua'
						},
					},
				},
			},
		})
	end,
	-- ==================
	--      ltex-ls
	-- ==================
	ltex = function()
		lspconfig.ltex.setup({
			-- capabilities = your_capabilities,
			---@diagnostic disable-next-line: unused-local
			on_attach = function(client, bufnr)
				require("ltex_extra").setup({ ltexConfig })
				lsp_attach(client, bufnr)
			end,
			capabilities = lsp_capabilities,
			settings = {
				ltex = {
					dictionary = {
						-- TODO: find a way to refresh after doing zg, currently have to reastart nvim
						["en-US"] = words,
					},
				},
			},
		})
	end,
	-- ==================
	--      eslint
	-- ==================
	eslint = function()
		lspconfig.eslint.setup({})
	end,
	-- ==================
	--      pyright
	-- ==================
	pyright = function()
		lspconfig.pyright.setup({})
	end
}

-- setup lsp's with mason
masonLspConfig.setup_handlers(handlers)

--  ┌                                                          ┐
--  │                                                          │
--  │ for nicer options when available, default to vim if not  │
--  │                                                          │
--  └                                                          ┘

--I like aesthetical upgrades
require("lspconfig.ui.windows").default_options.border = "rounded"

vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
	},
})



-- NOTE: Trying noice for a bit to handle this
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

-- to add pretty symbols for diganostics
local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = "",
	})
end

sign({ name = "DiagnosticSignError",   text = icons.error })
sign({ name = "DiagnosticSignWarn",    text = icons.warning })
sign({ name = "DiagnosticSignHint",    text = icons.loup })
sign({ name = "DiagnosticSignInfo",    text = icons.info })
sign({ name = "DiagnosticUnnecessary", text = icons.question })
sign({ name = "DiagnosticDeprecated",  text = icons.timeout })

-- for unused imports, just dim them, don't give "unsued package" message.
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { link = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { link = "NONE" })
