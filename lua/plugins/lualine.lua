return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons" -- Ícones bonitos para a barra
  },
  -- Carrega quase imediatamente para você ter o visual logo ao abrir o editor
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      options = {
        -- O Lualine detecta o Catppuccin e puxa as cores do seu tema automaticamente!
        theme = "catppuccin",

        -- Separadores elegantes em formato de setas/triângulos para um visual moderno
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },

        disabled_filetypes = {
          statusline = { "neo-tree" }, -- Oculta na barra lateral do Neo-tree para ficar mais limpo
        },
        always_divide_middle = true,
        globalstatus = true, -- Mantém uma única barra de status unificada mesmo se você dividir a tela (splits)
      },
      sections = {
        -- Lado Esquerdo
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } }, -- Modo atual (NORMAL/INSERT)
        lualine_b = { "branch", "diff", "diagnostics" }, -- Info do Git e erros do LSP
        lualine_c = { { "filename", path = 1 } }, -- Nome do arquivo (path = 1 mostra a pasta + nome)

        -- Lado Direito
        lualine_x = { "encoding", "fileformat", "filetype" }, -- Tipo de arquivo (ex: lua, javascript)
        lualine_y = { "progress" }, -- Porcentagem de rolagem do arquivo
        lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } }, -- Linha e Coluna atual do cursor
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
