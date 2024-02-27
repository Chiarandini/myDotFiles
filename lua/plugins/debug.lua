return {
	{ -- DAP client (Debug Adapter Protocol)
		"mfussenegger/nvim-dap",
		dependencies = {
			--  ┌                                                          ┐
			--  │                     dap enhancement                      │
			--  └                                                          ┘
			{
				"rcarriga/nvim-dap-ui",
				name = 'dapui',
				config = function()
					require('dapui').setup()
				end
			},

			{ -- for virtual text
				"theHamsta/nvim-dap-virtual-text",
				config = function()
					require("nvim-dap-virtual-text").setup()
				end,
			},
			--  ┌                                                          ┐
			--  │                language-specific plugins                 │
			--  └                                                          ┘
			{-- for python
				'mfussenegger/nvim-dap-python'
			},
			{ -- for Neovim lua langauge
				"jbyuki/one-small-step-for-vimkind",
				keys = { { '<leader>dal', function() require("osv").launch({ port = 8086 }) end, desc = 'Lua', },
				},
			},
			 -- JS/TS debugging.
            {
                'mxsdev/nvim-dap-vscode-js',
                opts = {
                    debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug',
                    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
                },
            },
            {
                'microsoft/vscode-js-debug',
                version = '1.x',
                build = 'npm i && npm run compile vsDebugServerBundle && mv dist out',
            },
		},
		--- stylua: ignore
		keys = {
		   {
		   '<F5>',
		   function()
			-- require('dapui').toggle()
			require("dap").continue()
			end,
		   desc = "Continue",
		   },
		   {
		   '<F6>',
		   function()
			require("dap").restart()
			end,
		   desc = "Continue",
		   },
		   {
			"<F17>", -- <S-F5>
			function()
				require("dap").terminate()
				require("dapui").toggle()
			end,
			desc = "Terminate",
		},
		   { "<F10>", function() require("dap").step_over() end, desc = "Step Over", },
		   { "<F11>", function() require("dap").step_into() end, desc = "Step Into", },
		   { "<F23>", function() require("dap").step_out() end, desc = "Step Out", },
		   { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint", },
		   {"<leader>dc", function()
			require'dap'.clear_breakpoints()
			vim.notify("Cleared Breakpoints", 2, { title="Debugger", icon = require('utils.icons').debug })
		end, desc = "clear breakpoints"},
		   { "<leader>dR", function() require("dap").run_to_cursor() end, desc = "Run to Cursor", },
		   {"<leader>di", function()require "dap.ui.widgets".hover() end, desc="information" },
		   { "<leader>de", function() require("dapui").eval() end, mode = {"n", "v"}, desc = "Evaluate", },
		   { "<leader>dE", function() require("dapui").eval(vim.fn.input "Expression > ") end, desc = "Evaluate Input", },
		   { "<leader>dC", function() require("dap").set_breakpoint(vim.fn.input "[Condition] > ") end, desc = "Conditional Breakpoint", },
		   { "<leader>bl", function() require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc = "logpoint breakpoint" },
		   { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle UI", },
		   { "<c-s>d", function() require("dapui").toggle() end, desc = "Toggle UI", },
		   { "<c-s-d>", function() require("dapui").toggle() end, desc = "Toggle UI", },
		   -- { "<leader>db", function() require("dap").step_back() end, desc = "Step Back", },
		   { "<leader>dg", function() require("dap").session() end, desc = "Get Session", },
		   { "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "Hover Variables", },
		   { "<leader>dS", function() require("dap.ui.widgets").scopes() end, desc = "Scopes", },
		   { "<leader>dp", function() require("dap").pause.toggle() end, desc = "Pause", },
		   { "<leader>dq", function() require("dap").close() end, desc = "Quit", },
		   { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL", },
		   { "<leader>ds", function() require("dap").continue() end, desc = "Start", },
		   { "<leader>dx", function() require("dap").terminate() end, desc = "Terminate", },
		   { "<leader>dt", function() require("dap").disconnect() end, desc = "Disconnect", },
		},
		opts = {
		  setup = {
		    osv = function(_, _)
		  	require("plugins.dap.lua").setup()
		    end,
		  },
		},
		-- lots of the configuration copied
		config = function(plugin, opts)
			-- set up debugger
			for k, _ in pairs(opts.setup) do
			  opts.setup[k](plugin, opts)
			end
			require("configs.debug")
		end,
	},
}
