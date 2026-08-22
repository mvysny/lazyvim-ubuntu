return {
  -- Enable neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        group_empty_dirs = true, -- collapse java-style package chains
      },
    },
  },

  -- Disable snacks.explorer, and make lazygit fullscreen
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
      styles = {
        lazygit = {
          width = 0,
          height = 0,
        },
      },
    },
  },
}
