vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- toggle relative line numbers
vim.keymap.set("n", "<leader>nn", function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
    print("relativenumber = ", vim.opt.relativenumber:get())
end)

-- toggle line wrapping
vim.keymap.set("n", "<leader>ll", function()
    vim.opt.wrap = not vim.opt.wrap:get()
    print("wrap = ", vim.opt.wrap:get())
end)

-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows

--  See `:help wincmd` for a list of all window commands
--  <C-w><C-v> to split vertically, <C-w><C-s> to split horizontally.
--  :only quits all splits except for the one in focus.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Copy/Cut/Paste from/to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y') --, { desc = "Copy to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y') --, { desc = "Copy to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d') --, { desc = "cut to clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>p", '"+p') --, { desc = "paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P') --, { desc = "paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d') --, { desc = "paste from clipboard" })

-- comment mappings
--[[
    Normal mode:
    `gcc` - Toggles the current line using linewise comment
    `gbc` - Toggles the current line using blockwise comment
    `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
    `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
    `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
    `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment 

    `gco` - Insert comment to the next line and enters INSERT mode
    `gcO` - Insert comment to the previous line and enters INSERT mode
    `gcA` - Insert comment to end of the current line and enters INSERT mode 

Visual mode:
    `gc` - Toggles the region using linewise comment
    `gb` - Toggles the region using blockwise comment
]]

--[[ fold key bindings:
    zR: open all folds
    zM: close all open folds
    za: toggle fold at the cursor

    zk and zj move between folds. ]]

local function close_all_folds()
    vim.api.nvim_exec2("%foldc!", { output = false })
end

local function open_all_folds()
    vim.api.nvim_exec2("%foldo!", { output = false })
end

vim.keymap.set("n", "<leader>zs", close_all_folds, { desc = "[s]hut all folds" })
vim.keymap.set("n", "<leader>zo", open_all_folds, { desc = "[o]pen all folds" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- stuff the primeagen uses. I'll check them out as I go.
--[[
   vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
   vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
   
   vim.keymap.set("n", "J", "mzJ`z")
   vim.keymap.set("n", "<C-d>", "<C-d>zz")
   vim.keymap.set("n", "<C-u>", "<C-u>zz")
   vim.keymap.set("n", "n", "nzzzv")
   vim.keymap.set("n", "N", "Nzzzv")
   vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

   vim.keymap.set("n", "<leader>vwm", function()
       require("vim-with-me").StartVimWithMe()
   end)
   vim.keymap.set("n", "<leader>svwm", function()
       require("vim-with-me").StopVimWithMe()
   end)
--]]

-- greatest remap ever
--vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
--vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
--vim.keymap.set("n", "<leader>Y", [["+Y]])

--vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

--[[
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--]]

--vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--[[
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set(
    "n",
    "<leader>ea",
    "oassert.NoError(err, \"\")<Esc>F\";a"
)

vim.keymap.set(
    "n",
    "<leader>ef",
    "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj"
)

vim.keymap.set(
    "n",
    "<leader>el",
    "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
)

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
--]]
