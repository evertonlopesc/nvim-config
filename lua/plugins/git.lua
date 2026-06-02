return {
  -- 1. GITSIGNS (Sinais na lateral e Git Blame flutuante)
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" }, -- Só carrega quando você abrir um arquivo
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "┃" },
          change       = { text = "┃" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
          untracked    = { text = "┆" },
        },
        -- Ativa a função de mostrar quem fez o commit na linha atual (Git Blame)
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500, -- Meio segundo parado na linha e ele mostra o autor
          virt_text_pos = "eol", -- Mostra no final da linha (End of Line)
        },
      })

      -- Atalhos rápidos para navegar entre as alterações do arquivo
      local keymap = vim.keymap.set
      keymap("n", "]c", "<cmd>Gitsigns next_hunk<CR>", { desc = "Próxima alteração do Git" })
      keymap("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Alteração anterior do Git" })
      keymap("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Visualizar alteração (Popup)" })
    end,
  },

  -- 2. NEOGIT (Interface completa para Commits/Push/Pull)
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim", -- Dependência fantástica para ver Diff de arquivos
      "nvim-tele/telescope.nvim"
    },
    -- Lazy loading: Só carrega quando você chamar a interface do Git
    keys = {
      { "<leader>gs", "<cmd>Neogit<cr>", desc = "Abrir Status do Neogit" },
    },
    config = function()
      require("neogit").setup({
        kind = "floating", -- Abre o painel do Git em uma janela flutuante linda
        integrations = {
          telescope = true, -- Integra com o seu Telescope para buscas
        },
      })
      vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "Histórico do Arquivo Atual" })
    end,
  },
}
