lua require("rwxd")

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fl <cmd>Telescope file_browser<cr>
nnoremap <leader>fv <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>fgg <cmd>Telescope git_files<cr>

nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fd :lua require('rwxd.telescope').search_dotfiles()<CR>
