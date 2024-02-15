return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        function(term)
          if term.direction == "horizontal" then
            return 50
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.8
          end
        end,
        direction = "horizontal", -- "vertical" | "horizontal" | "tab" | "float",
        auto_scroll = true,
        vim.keymap.set({'n', 'v'}, '<leader>t', ':ToggleTerm name=desktop<CR>',{}),
        vim.keymap.set({'t', 'n'}, '<esc>', [[<C-\><C-n>]], {}),
        vim.keymap.set({'t', 'n'}, '<C-h>', [[<Cmd>wincmd h<CR>]], {}),
        vim.keymap.set({'t', 'n'}, '<C-j>', [[<Cmd>wincmd j<CR>]], {}),
        vim.keymap.set({'t', 'n'}, '<C-k>', [[<Cmd>wincmd k<CR>]], {}),
        vim.keymap.set({'t', 'n'}, '<C-l>', [[<Cmd>wincmd l<CR>]], {}),
        vim.keymap.set({'t', 'n'}, '<C-w>', [[<C-\><C-n><C-w>]], {}),
      })
    end,
  },
}
