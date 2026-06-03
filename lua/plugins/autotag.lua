return {
  "windwp/nvim-ts-autotag",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-ts-autotag").setup({
      opts = {
        enable_close = true,          -- Fecha a tag automaticamente ao digitar ">"
        enable_rename = true,         -- Se você renomear a tag de abertura, a de fechamento muda junto!
        enable_close_on_slash = true, -- Fecha automaticamente em tags auto-contidas
      },
    })
  end,
}
