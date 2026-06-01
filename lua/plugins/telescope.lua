return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  
  -- O Lazy.nvim só vai carregar o Telescope quando você apertar um desses atalhos!
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Buscar Arquivos" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Buscar Texto" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Listar Buffers" },
    { "<leader>fh", function() require("telescope.builtin").oldfiles() end, desc = "Histórico" },
  },

  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        vimgrep_arguments = {
          "rg", "--color=never", "--no-heading", "--with-filename",
          "--line-number", "--column", "--smart-case", "--fixed-strings", "--trim"
        },
      },
    })
  end,
}
