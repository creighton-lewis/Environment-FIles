-- init.lua (single file with plugins + colorschemes + escape mapping)

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy.nvim
require("lazy").setup({
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
-- nvim tree
{
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
},

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },
 --oilvim
--{"stevearc/oil.nvim",
  --    dependencies = {
    --    { "nvim-mini/mini.nvim",  opts = {} },
      --  "nvim-tree/nvim-web-devicons", -- optional
     -- },
     -- lazy = false,
     -- opts = {}, -- oil's setup options
     -- vim.keymap.set("n","`", "<CMD>Oil<CR>", {desc = "Open parent directory"
      --  })
   -- },

  -- which-key
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  },

  -- catppuccin colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- everforest colorscheme
  {
    "sainnhe/everforest",
    config = function()
      -- uncomment the line below if you prefer everforest as default
      -- vim.cmd.colorscheme("everforest")
    end,
  },

}, {
  install = { colorscheme = { "catppuccin", "everforest" } },
  checker = { enabled = true },
})

-- keymaps
-- Make sure Escape always sends you back to Normal mode
vim.keymap.set({ "i", "v", "c" }, "<Esc>", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_create_user_command("TreeToggle", function()
  vim.cmd("NvimTreeToggle")
end, {})
