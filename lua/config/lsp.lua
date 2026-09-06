-- Neovim 0.11 Native LSP Configuration (Built-in LSP support without nvim-lspconfig plugin)

-- Configure diagnostic display options
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
	},
})

-- Buffer-local keymaps attached when an LSP server connects
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(event)
		local opts = { buffer = event.buf }
		local map = vim.keymap.set

		map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "LSP Go to Definition" }))
		map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "LSP Go to Declaration" }))
		map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "LSP Go to References" }))
		map("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "LSP Go to Implementation" }))
		map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP Hover Documentation" }))
		map("n", "<space>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP Rename Symbol" }))
		map(
			{ "n", "v" },
			"<space>ca",
			vim.lsp.buf.code_action,
			vim.tbl_extend("force", opts, { desc = "LSP Code Action" })
		)
		map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Previous Diagnostic" }))
		map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next Diagnostic" }))
		map("n", "<space>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Line Diagnostics" }))
	end,
})

-- Setup default capabilities with blink.cmp integration if present
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")
if ok then
	capabilities = blink.get_lsp_capabilities(capabilities)
end

-- Neovim 0.11 Native vim.lsp.config & vim.lsp.enable
if vim.lsp.config then
	-- Set default capabilities for all servers
	vim.lsp.config("*", {
		capabilities = capabilities,
	})

	-- Language server definitions using Nvim 0.11 native config
	local servers = {
		gopls = {
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_markers = { "go.work", "go.mod", ".git" },
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
						shadow = true,
					},
					staticcheck = true,
					completeUnimported = true,
					usePlaceholders = true,
				},
			},
		},
		lua_ls = {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			root_markers = { ".git", ".luarc.json", "init.lua" },
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = { checkThirdParty = false },
				},
			},
		},
		clangd = {
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--header-insertion=iwyu",
				"--completion-style=detailed",
				"--function-arg-placeholders",
				"--fallback-style=llvm",
			},
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
			root_markers = {
				".clangd",
				".clang-tidy",
				".clang-format",
				"compile_commands.json",
				"compile_flags.txt",
				"configure.ac",
				".git",
			},
		},
		hls = {
			cmd = { "haskell-language-server-wrapper", "--lsp" },
			filetypes = { "haskell", "lhaskell" },
			root_markers = { "*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", ".git" },
			settings = {
				haskell = {
					formattingProvider = "ormolu", -- hoặc "fourmolu" / "stylish-haskell"
					checkProject = true,
				},
			},
		}, -- Example for python pyright / gopls / clangd etc can be added here using native configs
	}

	for server_name, server_config in pairs(servers) do
		vim.lsp.config[server_name] = server_config
		vim.lsp.enable(server_name)
	end
end
