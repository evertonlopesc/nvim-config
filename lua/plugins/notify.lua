return {
  "rcarriga/nvim-notify",
  -- Carrega bem cedo para capturar todas as mensagens desde a inicialização
  event = "VeryLazy",
  config = function()
    local notify = require("notify")

    notify.setup({
      -- Tempo que a notificação fica na tela (em milissegundos)
      timeout = 3000,

      -- Estilo da animação: "fade", "slide", "fade_in_slide_out" ou "static"
      stages = "fade_in_slide_out",

      -- Ícones elegantes para cada tipo de mensagem
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },

      -- Aparência visual
      background_colour = "#000000", -- O plugin mescla isso com o fundo do Catppuccin automaticamente
      render = "default",
    })

    -- Diz ao Neovim para usar o nvim-notify como o gerenciador padrão de mensagens globais
    vim.notify = notify

    -- Atalho prático para limpar todas as notificações da tela se elas estiverem acumuladas
    vim.keymap.set("n", "<leader>nc", function()
      notify.dismiss({ pending = true, silent = true })
    end, { desc = "Limpar Notificações" })
  end,
}
