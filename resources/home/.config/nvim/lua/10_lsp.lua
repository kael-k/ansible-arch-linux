-- Load mason, required for mason-lspconfig
require("mason").setup()

---- LSP
-- LSP config loading
require("mason-lspconfig").setup{
	ensure_installed = {
		"bashls",
		"clangd",
        "codelldb",
        "cpptools",
		"dockerls",
		"docker_compose_language_service",
		"html",
		"jedi_language_server",
		"jsonls",
		"pyright",
        "rust_analyzer",
		"tailwindcss",
		"tsserver",
		"yamlls",
	}
}
local cmp = require'cmp'
cmp.setup{
	snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
          end
        },
	sources = { { name = 'nvim_lsp' } },
	mapping = cmp.mapping.preset.insert({
	    ["<C-p>"] = cmp.mapping.select_prev_item(),
	    ["<C-n>"] = cmp.mapping.select_next_item(),
	    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
	    ["<C-f>"] = cmp.mapping.scroll_docs(4),
	    ["<C-Space>"] = cmp.mapping.complete(),
	    ["<C-e>"] = cmp.mapping.close(),
	    ["<CR>"] = cmp.mapping.confirm({
	      behavior = cmp.ConfirmBehavior.Replace,
	      select = true,
	    }),
	    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
	    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        })
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("lspconfig").bashls.setup {capabilities = capabilities}
require("lspconfig").dockerls.setup {capabilities = capabilities}
require("lspconfig").docker_compose_language_service.setup {capabilities = capabilities}
require("lspconfig").html.setup {capabilities = capabilities}
require("lspconfig").jedi_language_server.setup {capabilities = capabilities}
require("lspconfig").jsonls.setup {capabilities = capabilities}
require("lspconfig").tailwindcss.setup {capabilities = capabilities}
require("lspconfig").yamlls.setup {capabilities = capabilities}

require("lsp_signature").setup()

vim.cmd([[
    " Show doc of a resource
    nnoremap K :lua vim.lsp.buf.hover()<CR> 
    
    " Goto definition
    nnoremap gd :lua vim.lsp.buf.definition()<CR>

    " Find references/usages
    nnoremap gr :lua vim.lsp.buf.references()<CR>

    " Go to implementation (e.g., subclass)
    nnoremap gi :lua vim.lsp.buf.implementation()<CR>

    " Go to type definition (superclass/interface)
    nnoremap gT :lua vim.lsp.buf.type_definition()<CR>
    
    nnoremap ge :lua vim.diagnostic.open_float()<CR>
    nnoremap [d :lua vim.diagnostic.goto_prev()<CR>
    nnoremap ]d :lua vim.diagnostic.goto_next()<CR>
]])
