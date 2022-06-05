lua require('refactoring').setup({})

nnoremap <silent> <leader>rr :lua require("theprimeagen.telescope").refactors()<CR>

" Extracts
vnoremap <silent> <leader>ref :lua require("refactoring").refactor(106)<CR>
nnoremap <silent> <leader>ri :lua require("refactoring").refactor(123)<CR>
vnoremap <silent> <leader>rev :lua require("refactoring").refactor("extract_var")<CR>
