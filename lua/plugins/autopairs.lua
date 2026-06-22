return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true, -- Integração com o Treesitter para ser mais inteligente
    })
  end,
}
