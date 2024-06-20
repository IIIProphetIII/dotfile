-- require "nvchad.mappings"

local map = vim.keymap.set

-- from nvchat.mappings
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "format files" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal new horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- blankline
map("n", "<leader>/", function()
  local config = { scope = {} }
  config.scope.exclude = { language = {}, node_type = {} }
  config.scope.include = { node_type = {} }
  local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

  if node then
    local start_row, _, end_row, _ = node:range()
    if start_row ~= end_row then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
      vim.api.nvim_feedkeys("_", "n", true)
    end
  end
end, { desc = "blankline jump to current context" })

-- add yours here
map("n", ";", ":", { desc = "CMD enter command mode" })
map({"n","v"}, "J", "5j", { desc = "Quick move down" })
map({"n","v"}, "K", "5k", { desc = "Quick move up" })
map({"n","v"}, "H", "b", { desc = "Quick move left" })
map({"n","v"}, "L", "e", { desc = "Quick move right" })
map("i", "jk", "<ESC>", { desc = "Quick exit insert mode" })
map("n", "<Leader><CR>", "<cmd>noh<CR>", { desc = "Clear hightlight" })

map("n", "S", "<cmd>w<CR>", { desc = "Save" })
map("n", "Q", function()
  local pre=#vim.t.bufs
  require("nvchad.tabufline").close_buffer()
  if pre == #vim.t.bufs then
    vim.cmd "q"
  end
end, { desc = "close" })
map("n", "<leader>n", "<cmd>set nu!<CR><cmd>set rnu!<CR>", { desc = "toggle line number" })
map("n", "<Leader>sc", "<cmd>set spell!<CR>", { desc = "Spelling Check"})

map("n", "<C-n>", "<cmd>tabe<CR>", { desc = "new tab"})

-- Comment
map("n", "<leader>cc", "gcc", { desc = "comment toggle", remap = true })
map("v", "<leader>cc", "gc", { desc = "comment toggle", remap = true })

-- nerdtree
map("n", "tt", "<cmd>NERDTreeToggle<CR>", { desc = "nerdtree toggle window" })
map("n", "<C-f>", "<cmd>NERDTreeFind<CR>", { desc = "nerdtree find current file" })
vim.api.nvim_set_var("NERDTreeMapUpdirKeepOpen", "h")
vim.api.nvim_set_var("NERDTreeMapActivateNode", "l")
vim.api.nvim_set_var("NERDTreeMapChangeRoot", "y")


-- Split Window Keymap
map("n", "sl", ":set splitright<CR>:vsplit<CR>")
map("n", "sh", ":set nosplitright<CR>:vsplit<CR>")
map("n", "sj", ":set splitbelow<CR>:split<CR>")
map("n", "sk", ":set nosplitbelow<CR>:split<CR>")
map("n", "sk", ":set nosplitbelow<CR>:split<CR>")
map("n", "sk", ":set nosplitbelow<CR>:split<CR>")
map("n", "sk", ":set nosplitbelow<CR>:split<CR>")

map("n", "<Leader>h", "<C-w>h", { desc = "switch window left" })
map("n", "<Leader>j", "<C-w>j", { desc = "switch window down" })
map("n", "<Leader>k", "<C-w>k", { desc = "switch window up" })
map("n", "<Leader>l", "<C-w>l", { desc = "switch window right" })

map("n", "U", ":UndotreeToggle<CR>")
map("n", "<leader>zn", ":ZenMode<CR>", {})

map("n", "<LEADER>rc", ":tabe ~/.config/nvim/init.lua<CR>", {desc = "Open the vimrc file anytime"})
