return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Ícones bonitos nas abas
  },
  -- Carrega logo no início para você sempre ver suas abas ao abrir arquivos
  event = "VeryLazy",

  -- Atalhos práticos para navegar entre as abas e fechar arquivos
  keys = {
    -- Tab e Shift+Tab para navegar entre os arquivos abertos
    { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Próxima Aba" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Aba Anterior" },
    -- Atalho para fechar o arquivo atual sem quebrar o layout das janelas
    { "<leader>x", "<cmd>bdelete!<cr>", desc = "Fechar Aba Atual" },
  },

  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "thin", -- Estilo elegante e fino para dividir as abas
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = false,

        -- Integração com o Neo-tree: faz o Bufferline "dar espaço" para a barra lateral
        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorador de Arquivos",
            text_align = "center",
            separator = true,
          }
        },

        -- Mostra indicadores visuais se o arquivo tiver erros captados pelo LSP
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
      }
    })
  end,
}
