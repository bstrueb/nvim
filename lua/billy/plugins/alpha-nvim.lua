return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope.nvim" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                                          ",
      " ██████╗ ██╗██╗     ██╗  ██╗   ██╗██╗   ██╗██╗███╗   ███╗ ",
      " ██╔══██╗██║██║     ██║  ╚██╗ ██╔╝██║   ██║██║████╗ ████║ ",
      " ██████╔╝██║██║     ██║   ╚████╔╝ ██║   ██║██║██╔████╔██║ ",
      " ██╔══██╗██║██║     ██║    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      " ██████╔╝██║███████╗███████╗██║    ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      " ╚═════╝ ╚═╝╚══════╝╚══════╝╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                          ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("n", "  New File", "<cmd>ene<CR>"),
      dashboard.button("e", "  Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("f", "󰱼  Find File", "y<cmd>Telescope find_files<CR>"),
      dashboard.button("w", "  Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
      dashboard.button(
        "c",
        "  Config",
        "<cmd> lua require('telescope.builtin').find_files( { cwd = vim.fn.fnamemodify(vim.env.MYVIMRC, ':h') }) <CR>"
      ),
      dashboard.button("q", "  Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
