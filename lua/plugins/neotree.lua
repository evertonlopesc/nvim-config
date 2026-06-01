return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Ícones bonitos para os arquivos
    "MunifTanjim/nui.nvim",
  },
  -- Lazy loading: Só carrega o plugin quando você apertar o atalho para abrir
  keys = {
    { "<leader>e", "<cmd>Neotree toggle filesystem left<cr>", desc = "Abrir/Fechar Explorador de Arquivos" },
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true, -- Mostra arquivos ocultos (como .gitignore, .env) por padrão
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true, -- Foca automaticamente no arquivo que você está editando no momento
        },
      },
      window = {
        width = 30,
        mappings = {
          ["<space>"] = "none", -- Desativa o espaço no Neo-tree para não conflitar com sua tecla Leader
        },
      },
    })
  end,
}
