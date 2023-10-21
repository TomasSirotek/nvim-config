local builtin = require('telescope.builtin')
local Remap = require("dev.keymap")
local nnoremap = Remap.nnoremap

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({search = vim.fn.input("Grep > ") });
end)
