local servers = {"lua_ls", "pylsp", "jdtls", "tsserver"}
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = { exclude = "jdtls" },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.pylsp.setup({
        settings = {
          -- linter options
          pylint = { enabled = true, executable = "pylint" },
          -- type checker
          pylsp_mypy = {
            enabled = true,
            overrides = { "--python-executable", '~/Downloads/programs/miniconda3/bin/python3.11', true },
            report_progress = true,
            live_mode = false
          },
          -- auto-completion options
          jedi_completion = { fuzzy = true },
          -- import sorting
          isort = { enabled = true },
        },
        capabilities = capabilities
      })

      lspconfig.jdtls.setup({})
      lspconfig.tsserver.setup({})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  },
  {
    "HallerPatrick/py_lsp.nvim",
    config = function()
      require'py_lsp'.setup {
        -- This is optional, but allows to create virtual envs from nvim
        host_python = "~/Downloads/programs/miniconda3/bin/python",
        default_venv_name = ".venv" -- For local venv
      }
    end
  }
}

