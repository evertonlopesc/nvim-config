return {
  -- 1. MASON (Gerenciador de Instalação)
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup({
        ui = { border = "rounded" }
      })
    end,
  },

  -- 2. LFPCONFIG & MASON-LSPCONFIG
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      -- Lista dos servidores que você quer rodar
      local servers = {
        "lua_ls",
        "pyright",
        "solargraph",
        "ts_ls",
        "rust_analyzer"
      }

      mason_lspconfig.setup({
        ensure_installed = servers,
      })

      -- Atalhos de teclado do LSP
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        local keymap = vim.keymap.set

        opts.desc = "Ir para Definição"
        keymap("n", "gd", vim.lsp.buf.definition, opts)

        opts.desc = "Mostrar Documentação/Hover"
        keymap("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Ações de Código"
        keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Renomear Variável"
        keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Mostrar Referências"
        keymap("n", "gr", function() require('telescope.builtin').lsp_references() end, opts)
      end

      -- Capacidades de Autocompletar
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if cmp_status then
        capabilities = cmp_nvim_lsp.default_capabilities()
      end

      -- INICIALIZAÇÃO ATUALIZADA (Adequada para o Neovim mais recente)
      -- Em vez de lspconfig[server].setup(), usamos o novo padrão vim.lsp.config
      for _, server in ipairs(servers) do
        -- ts_ls precisa de um pequeno ajuste de nome na API nativa se necessário, 
        -- mas o vim.lsp.config aceita a tabela de configurações diretamente:
        local config = {
          on_attach = on_attach,
          capabilities = capabilities,
        }

        -- Tenta usar a nova API nativa; se não existir no seu core ainda, ele usa o lspconfig antigo sem chiar
        if vim.lsp.config then
          vim.lsp.config(server, config)
        else
          lspconfig[server].setup(config)
        end
      end

      -- Janelas flutuantes arredondadas
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = "rounded" })
    end,
  },

  -- 3. MOTOR DE AUTOCOMPLETAR (nvim-cmp)
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
