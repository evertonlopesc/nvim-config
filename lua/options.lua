vim.g.netrw_banner = 0 -- Oculta o banner informativo
vim.g.netrw_liststyle = 3 -- Visualização em árvore (tree style)

local opt = vim.opt

-- Configurações de Aparência e Interface
opt.number = true          -- Mostra o número da linha atual
opt.relativenumber = true  -- Números relativos (ótimo para navegação)
opt.signcolumn = "yes"     -- Sempre mostra a coluna de sinais (evita pulos na tela)

-- Configuração de Colunas (Limite de 100 caracteres)
opt.colorcolumn = "100"    -- Desenha uma linha vertical na coluna 100
opt.textwidth = 100        -- Limita teoricamente o texto a 100 colunas

-- Configuração de Quebra de Linha (Wrap)
opt.wrap = true            -- Ativa a quebra de linha visual
opt.linebreak = true       -- Quebra a linha apenas em palavras inteiras (não corta palavras)
opt.breakindent = true     -- Mantém a indentação da linha original na linha quebrada

-- Configurações de Indentação Padrão (2 espaços por padrão)
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Área de transferência (O que conversamos antes: integra com o navegador!)
opt.clipboard = "unnamedplus"

-- Criar um grupo para organizar as nossas automações nativas
local autocmd_group = vim.api.nvim_create_augroup("CustomAutocommands", { clear = true })

-- Remover trailing whitespaces automaticamente antes de salvar qualquer arquivo
vim.api.nvim_create_autocmd("BufWritePre", {
  group = autocmd_group,
  pattern = "*",
  callback = function()
    -- Guarda a posição atual do cursor para você não perder o foco de onde estava digitando
    local save_cursor = vim.fn.getpos(".")

    -- Executa a substituição global (procura por espaços no fim da linha e substitui por nada)
    -- O 'pcall' serve para o Neovim não disparar um erro visual caso o arquivo já esteja limpo
    pcall(function()
      vim.cmd([[%s/\s\+$//e]])
    end)

    -- Devolve o cursor exatamente para o mesmo sítio onde você estava
    vim.fn.setpos(".", save_cursor)
  end,
})
