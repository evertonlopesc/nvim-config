return {
  "lukas-reineke/indent-blankline.nvim",
  -- Carrega assim que você abre um arquivo de texto
  event = { "BufReadPost", "BufNewFile" },
  main = "ibl", -- Atalho interno que o plugin usa para inicializar
  config = function()
    local ibl = require("ibl")

    ibl.setup({
      -- Define o caractere da linha vertical (pode ser "│", "┆", "┊", etc.)
      indent = {
        char = "│",
      },
      -- Desativa as linhas em janelas onde elas não fazem sentido (como telas de ajuda ou no Neo-tree)
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Lazy",
          "mason",
          "notify",
          "toggleterm",
        },
      },
      scope = {
        enabled = true, -- Ativa o destaque inteligente do escopo atual
        show_start = false, -- Não bota uma linha horizontal no topo do bloco
        show_end = false, -- Não bota uma linha horizontal no fim do bloco
      },
    })
  end,
}
