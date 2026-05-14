vim.pack.add({
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/folke/which-key.nvim',
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-telescope/telescope.nvim',
	'https://github.com/nvim-tree/nvim-tree.lua',
	'https://github.com/nvim-tree/nvim-web-devicons',
	'https://github.com/akinsho/bufferline.nvim',
	'https://github.com/windwp/nvim-autopairs',
	'https://github.com/hrsh7th/cmp-nvim-lsp',
	'https://github.com/hrsh7th/cmp-buffer',
	'https://github.com/hrsh7th/cmp-path',
	'https://github.com/hrsh7th/cmp-cmdline',
	'https://github.com/hrsh7th/nvim-cmp',
	'https://github.com/goolord/alpha-nvim',
})

-- vim.pack.update()

vim.lsp.config('rust-analyzer', {
	cmd = {'rust-analyzer'},
	filetypes = {'rust'},
})
vim.lsp.enable('rust-analyzer')

vim.diagnostic.config({ virtual_text = true })

require("alpha").setup(require("alpha.themes.dashboard").config)
require("nvim-autopairs").setup {}
require("oil").setup({
	default_file_explorer = true,
	columns = { "icon", "permissions", "size", "mtime", },
	watch_for_changes = true,
	view_options = {
		show_hidden = true,
		natural_order = "fast",
		case_insensitive = false,
		sort = {
			{ "type", "asc" },
			{ "name", "asc" },
		},
	}
})
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
	filters = {
		dotfiles = true,
	},
})
require('bufferline').setup{
	options = {
		offsets = {
			{ filetype = "NvimTree", text = "...", highlight = "Directory",
				separator = true -- use a "true" to enable the default, or set your own character
			}
		}
	}
}
local cmp = require'cmp'
cmp.setup({
	snippet = {
	  expand = function(args)
		vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
	  end,
	},
	window = {
	  -- completion = cmp.config.window.bordered(),
	  -- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
	  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.abort(),
	  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
	  { name = 'nvim_lsp' },
	  { name = 'vsnip' },
	}, {
	  { name = 'buffer' },
	})
})
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources(
		{{ name = 'path' }}, {{ name = 'cmdline' }}
	),
	matching = { disallow_symbol_nonprefix_matching = false }
})

local options = {
	laststatus = 3,
	showmode = false, --not needed due to lualine
	showcmd = false,
	wrap = true, -- bound to leader-W
	mouse = "a", --enable mouse
	clipboard = "unnamedplus", -- system clipboard
	history = 100, --command line history
	swapfile = false, --swap just gets in the way, usually
	backup = false,
	undofile = true, --undos are saved to file
	cursorline = false,
	ttyfast = true, --faster scrolling
	smoothscroll = true,
	relativenumber = true, --toggle bound to leader-n
	numberwidth = 5,
	smarttab = true, --indentation stuff
	cindent = true,
	autoindent = false,
	tabstop = 4, --visual width of tab
	shiftwidth = 4,
	termguicolors = true,
	ignorecase = true, --ignore case while searching
	smartcase = true, --but do not ignore if caps are used
	splitkeep = 'screen', --stablizie window open/close
	signcolumn = "yes:1",
	confirm = true,
}
for k, v in pairs(options) do
	vim.opt[k] = v
end

local function map(m, k, v, d)
	vim.keymap.set(m, k, v, { desc = d, noremap = true, silent = true })
end
vim.api.nvim_set_keymap('i', 'qq', '<ESC>', { noremap = true, silent = true })

map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local telescope = require('telescope.builtin')
map('n', '<leader>f', telescope.find_files, 'Telescope find files')
map('n', '<leader>sg', telescope.live_grep, 'Telescope live grep')
map('n', '<leader>sb', telescope.buffers, 'Telescope buffers')
map('n', '<leader>b', telescope.buffers, 'Telescope buffers')
map('n', '<leader>sh', telescope.help_tags, 'Telescope help tags')

map('n', '<leader>w', '<CMD>w<CR>', 'Save')
map('n', '<leader>q', '<CMD>q<CR>', 'Exit')
map('v', '>', '> gv', 'Indent keep selection')
map('v', '<', '< gv', 'Indent keep selection')
map('n', '|', ":vsplit<CR>", "split vertical")
map('n', '-', ":split<CR>", "split horizontal")
map('n', '<leader>e', '<CMD>Oil<CR>', "Oil")
map('n', '<leader>E', '<CMD>NvimTreeToggle<CR>', "Toggle NvimTree")
map('n', '<A-j>', "<CMD>m .+1<CR>==", "move line down")
map('n', '<A-k>', "<CMD>m .-2<CR>==", "move line up")
map("v", '<A-j>', ":m '>+1<CR>gv=gv", "move selection up")
map("v", '<A-k>', ":m '<-2<CR>gv=gv", "move selection down")
map('n', '<leader>h', '<CMD>noh<CR>', 'disable hightlighting')
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", "make a file executable")
map("n", "<leader>W", ":set wrap!<CR>", "toggle wrap")
map("n", "<leader>n", function()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
		vim.wo.number = true
	else
		vim.wo.relativenumber = true
	end
end, 'toogle relative num')
map("n", "<C-down>", ":resize +2<CR>")
map("n", "<C-up>", ":resize -2<CR>")
map("n", "<C-left>", ":vertical resize -2<CR>")
map("n", "<C-right>", ":vertical resize +2<CR>")

-- anoying wrapping solution
-- vim.fn("nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')")
-- vim.fn("nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')")
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

vim.cmd.colorscheme("lunaperche")

if vim.g.neovide then
	-- vim.g.neovide_floating_corner_radius = 1.0
	vim.api.nvim_set_keymap("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
	vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
	vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end

