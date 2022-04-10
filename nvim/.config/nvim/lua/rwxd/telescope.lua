local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        pickers = {
            find_files = {
                hidden = true
            }
        },

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sort = true,
            override_file_sorter = true,
            case_mode = "ignore_case",
        },
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
    },
}
})

require("telescope").load_extension("fzy_native")
-- require("telescope").load_extension("fzf")

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").git_files({
        prompt_title = "< dotfiles >",
        cwd = "~/.dotfiles/",
        hidden = true,
    })
end

return M
