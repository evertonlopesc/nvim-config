-- lua/keymaps./init.lua
require("keymaps/general")

-- Função para recarregar as configurações limpando o cache
_G.ReloadConfig = function()
  for name, _ in pairs(package.loaded) do
    if name:match("^keymaps")
       or name:match("^options") then
      package.loaded[name] = nil
    end
  end

  -- Recarrega apenas o arquivo de opções e atalhos manualmente
  dofile(vim.fn.stdpath("config") .. "/lua/options.lua")
  dofile(vim.fn.stdpath("config") .. "/lua/keymaps/init.lua")

  print("Configurações de opções e atalhos recarregadas!")
end

vim.g.mapleader = " "
local map = vim.keymap.set

-- Atalho para rodar a função com <leader>sr (Source Reload)
map("n", "<leader>sr", "<cmd>lua ReloadConfig()<cr>", { desc = "Recarregar configurações" })

