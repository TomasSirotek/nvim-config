local Remap = require("dev.keymap")
local nnoremap = Remap.nnoremap

local silent = { silent = true }

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "z", api.tree.change_root_to_node, opts("CD"))
end

  local icons = require "dev.icons"

require("nvim-tree").setup({
  on_attach = my_on_attach,
  view = {
    side = "left",
    width = 40,
  },
  renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = false,
      full_name = false,
      highlight_opened_files = "none",
      root_folder_label = ":t",
      indent_width = 2,
      indent_markers = {
        enable = false,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          none = " ",
        },
  },
      --   icons = {
      --   git_placement = "before",
      --   padding = " ",
      --   symlink_arrow = "→",
      --   glyphs = {
      --     default = icons.ui.Text,
      --     bookmark = icons.ui.BookMark,
      --     folder = {
      --       arrow_closed = icons.ui.ChevronRight,
      --       arrow_open = icons.ui.ChevronShortDown,
      --       default = icons.ui.Folder,
      --       open = icons.ui.FolderOpen,
      --       empty = icons.ui.EmptyFolder,
      --       empty_open = icons.ui.EmptyFolderOpen,
      --       symlink = icons.ui.FolderSymlink,
      --       symlink_open = icons.ui.FolderOpen,
      --     },
        
      --   },
      -- },
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
      symlink_destination = true,
    },
    update_focused_file = {
      enable = true,
      debounce_delay = 15,
      update_root = true,
      ignore_list = {},
  },

  actions = { open_file = { quit_on_open = true } },
  filters = { dotfiles = false, custom = { "^.DS_Store$", "^\\.git$" } },
  git = { enable = true, ignore = false, timeout = 500 },
})

nnoremap("<leader><tab>", "<Cmd>NvimTreeToggle<CR><Cmd>only<CR>", silent)
nnoremap("<leader>f<tab>", "<Cmd>NvimTreeFindFileToggle<CR><Cmd>only<CR>", silent)
nnoremap("<leader>z", "<Cmd>NvimTreeCollapse<CR>", silent)
