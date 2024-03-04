return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local mason_lsp = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      mason_lsp.setup({
        ensure_installed = { "lua_ls", "biome", "hydra_lsp", "taplo", "rust_analyzer", "wgsl_analyzer", "jedi_language_server" }
      })
      mason_lsp.setup_handlers({
        function(server)
          lspconfig[server].setup({ capabilities = capabilities })
        end
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- local lspconfig = require("lspconfig")

      -- -- LSP Setups
      -- lspconfig.lua_ls.setup({ capabilities = capabilities })
      -- lspconfig.biome.setup({ capabilities = capabilities })
      -- lspconfig.hydra_lsp.setup({ capabilities = capabilities })
      -- lspconfig.taplo.setup({ capabilities = capabilities })

      -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

      local opts = { }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end
  }
}
