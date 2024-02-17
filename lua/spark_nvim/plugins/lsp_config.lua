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
        ensure_installed = { "lua_ls", "biome", "hydra_lsp", "taplo", 'rust_analyzer' }
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

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end
  }
}
