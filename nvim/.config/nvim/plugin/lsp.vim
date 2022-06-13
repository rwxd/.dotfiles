autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
nnoremap <leader>Lr <cmd>LspRestart<cr>
nnoremap <leader>Ls <cmd>LspStop<cr>
nnoremap <leader>LS <cmd>LspStart<cr>
nnoremap <leader>Li <cmd>LspInfo<cr>
