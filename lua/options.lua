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
