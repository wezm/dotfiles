-- Setup nvim-cmp.
local cmp = require'cmp'
local luasnip = require("luasnip")

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer', keyword_length = 5 },
  })
})


-- NOTE: change "plugin.cmp.debounce" to location of debounce.lua
-- If it's in the lua folder, then change to "debounce"

-- vim.cmd([[
--   augroup CmpDebounceAuGroup
--     au!
--     au TextChangedI * lua require("debounce").debounce()
--   augroup end
-- ]])

-- Set configuration for specific filetype.
--- cmp.setup.filetype('gitcommit', {
---   sources = cmp.config.sources({
---     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
---   }, {
---     { name = 'buffer' },
---   })
--- })

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer', keyword_length = 4 }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline', max_item_count = 10 }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local nvim_lsp = require'lspconfig'
local lsp_attach = function(client, buf)
    -- Example maps, set your own with vim.api.nvim_buf_set_keymap(buf, "n", <lhs>, <rhs>, { desc = <desc> })
    -- or a plugin like which-key.nvim
    -- <lhs>        <rhs>                        <desc>
    vim.api.nvim_buf_set_keymap(buf, "n", "K"         , "<cmd>lua vim.lsp.buf.hover()<CR>"           , { desc = "Hover Info" })
    vim.api.nvim_buf_set_keymap(buf, "n", "<leader>qf", "<cmd>lua vim.diagnostic.setqflist()<CR>"    , { desc = "Quickfix Diagnostics" })
    vim.api.nvim_buf_set_keymap(buf, "n", "[d"        , "<cmd>lua vim.diagnostic.goto_prev()<CR>"    , { desc = "Previous Diagnostic" })
    vim.api.nvim_buf_set_keymap(buf, "n", "]d"        , "<cmd>lua vim.diagnostic.goto_next()<CR>"    , { desc = "Next Diagnostic" })
    vim.api.nvim_buf_set_keymap(buf, "n", "<leader>ed" , "<cmd>lua vim.diagnostic.open_float()<CR>"  , { desc = "Explain Diagnostic" })
    vim.api.nvim_buf_set_keymap(buf, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>"     , { desc = "Code Action" })
    vim.api.nvim_buf_set_keymap(buf, "n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>"          , { desc = "Rename Symbol" })
    vim.api.nvim_buf_set_keymap(buf, "n", "<leader>fs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>" , { desc = "Document Symbols" })
    vim.api.nvim_buf_set_keymap(buf, "n", "<leader>fS", "<cmd>lua vim.lsp.buf.()<CR>workspace_symbol", { desc = "Workspace Symbols" })
    vim.api.nvim_buf_set_keymap(buf, "n", "gf"        , "<cmd>lua vim.lsp.buf.formatting_sync()<CR>" , { desc = "Format File" })
    vim.api.nvim_buf_set_keymap(buf, "n", "gd"        , "<cmd>lua vim.lsp.buf.definition()<CR>"      , { desc = "Go to Definition" })

    -- " nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
    -- nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
    -- nnoremap <silent> gd    <cmd>lua vim.lsp.buf.implementation()<CR>
    -- nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
    -- nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
    -- nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
    -- nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
    -- nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
    -- nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
    -- nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
    -- nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

    vim.api.nvim_buf_set_option(buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")
    vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_buf_set_option(buf, "tagfunc", "v:lua.vim.lsp.tagfunc")
end

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        on_attach = lsp_attach,
        capabilities = capabilities,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

-- FIXME: Causes and error reltaed to module 'debugger' not found
-- require('rust-tools').setup(opts)

require('lspconfig')['rust_analyzer'].setup {
  capabilities = capabilities
}
