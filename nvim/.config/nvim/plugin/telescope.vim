lua require("rwxd")

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fl <cmd>Telescope file_browser<cr>
nnoremap <leader>fv <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>Telescope lsp_definitions<cr>
nnoremap <leader>fr <cmd>Telescope lsp_references<cr>

nnoremap <leader>fgf <cmd>Telescope git_files<cr>

nnoremap <leader>dot :lua require('rwxd.telescope').search_dotfiles()<CR>
