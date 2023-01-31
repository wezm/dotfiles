local nvim_lsp = require'lspconfig'

nvim_lsp["nickel_ls"].setup {}

require('rust-tools').setup()
