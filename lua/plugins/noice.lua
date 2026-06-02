return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify", -- Usa o notify que você já tem para os avisos
  },
  config = function()
    require("noice").setup({
      lsp = {
        -- Faz o Noice gerenciar os popups de documentação do LSP (ex: quando aperta K)
        override = {
          ["vim.lsp.util.convert_markdown_to_lines"] = true,
          ["vim.lsp.util.preview_filename"] = true,
          ["iris.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = false,    -- Desativa a busca clássica no rodapé
        command_palette = true,  -- Transforma o ":" em um pop-up centralizado lindo!
        long_message_to_split = true, -- Mensagens gigantes vão para um split em vez de travar a tela
        inc_rename = false,      -- Desativa suporte a plugins externos que você não usa ainda
      },
      views = {
        -- Garante que as bordas do pop-up de comando sejam arredondadas
        cmdline_popup = {
          position = { row = "30%", col = "50%" },
          size = { width = 60, height = "auto" },
          border = { style = "rounded" },
        },
      },
    })
  end,
}
