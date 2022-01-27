local options = {
  -- Write a backup before overwriting a file 
  backup = false,

  -- Allow Neovim to access the system clipboard
  clipboard = "unnamedplus",

  -- Number of lines to use for the command line
  cmdheight = 1,

  -- Set completion menu options
  completeopt = { "menu", "menuone", "noinsert", "noselect" },

  -- Highlight current cursor line
  cursorline = true,

  -- Add horizontal splits for diff mode
  diffopt = vim.opt.diffopt:append "horizontal",

  -- Set file encoding used in neovim
  fileencoding = "utf-8",

  -- Use spaces when <tab> is inserted
  expandtab = true,

  -- Change buffer fill characters
  fillchars = vim.opt.fillchars:append "eob:.",

  -- Don't unload buffer when abandoned
  hidden = true,

  -- Ignore case in search patterns
  ignorecase = true,

  -- Enable incremental search, as search patterns are typed
  incsearch = true,

  -- Treat words with - as a whole word
  iskeyword = vim.opt.iskeyword:append "-",

  -- Enable mouse mode
  mouse = "a",

  -- Print the line number in front of each line
  number = true,

  -- Show relative line numbers in the gutter
  relativenumber = true,

  -- Minimum number of lines above and below cursor
  scrolloff = 10,

  -- Number of spaces to use for (auto) indent step
  shiftwidth = 2,

  -- Don't pass messages to |ins-completion-menu|
  shortmess = vim.opt.shortmess:append "c",

  -- Show INSERT, VISUAL, REPLACE mode  
  showmode = true,

  -- Number of spaces to left and right of cursor
  sidescrolloff = 8,

  -- Always show the sign column
  signcolumn = "yes",

  -- Override ignorecase when search contains uppercase characters
  smartcase = true,

  -- Enable smart indentation
  smartindent = true,

  -- Put new window to the right of the current
  splitright = true,

  -- Put new window below the current
  splitbelow = true,

  -- Enable/disable swap file generation
  swapfile = false,

  -- Set tabstop to 2 spaces
  tabstop = 2,

  -- Enable 24-bit RGB color
  termguicolors = true,

  -- Create an undo file to persist undo's
  undofile = true,

  -- Time in ms in which swap file will be written, after typing stops
  updatetime = 300,

  -- Allow keys to continue navigation on prev/next line
  whichwrap = vim.opt.whichwrap:append "h,l",

  -- Enable/disable line wrapping
  wrap = false,

  -- Write a backup before overwriting a file 
  writebackup = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

