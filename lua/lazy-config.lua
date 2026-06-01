-- 1. Bootstrap (Mantemos o download automático do Lazy)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Falha ao clonar o lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPressione qualquer tecla para sair...", "MoreMsg" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- 2. Inicializa o Lazy apontando para a própria pasta "plugins"
require("lazy").setup({
  spec = {
    -- Isso diz ao Lazy: "Importe tudo o que estiver dentro de lua/plugins/"
    { import = "plugins" },
  },
  ui = {
    border = "rounded",
  },
})
