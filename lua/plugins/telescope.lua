return {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			-- build is used to run some commands when the plugin is installed
			build = 'make',
			-- cond is used to determine whether this plugin should be installed or updated
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
		{ 'BurntSushi/ripgrep' },
		{ 'nvim-telescope/telescope-ui-select.nvim' },
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
	},
	config = function()
		require('telescope').setup {
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown(),
				},
			},
		}

		-- enable extension if they are installed
		pcall(require('telescope').load_extension, 'fzf')
		pcall(require('telescope').load_extension, 'ui-select')

		-- see :help telescope.builtin
		local bultin = require 'telescope.builtin'
		vim.keymap.set('n', '<leader>sh', bultin.help_tags, { desc = '[S]earch [H]elp' })
		vim.keymap.set('n', '<leader>sk', bultin.keymaps, { desc = '[S]earch [K]eymaps' })
		vim.keymap.set('n', '<leader>sf', bultin.find_files, { desc = '[S]earch [F]iles' })
		-- vim.keymap.set('n', '<leader>ss', bultin.builtin, { desc = '[S]earch [S]elect Telescope' })
		vim.keymap.set('n', '<leader>sg', bultin.live_grep, { desc = '[S]earch by [G]rep' })
		-- vim.keymap.set('n', '<leader>s.', bultin.resume, { desc = '[S]earch Resume ([.] for repeat)' })
		-- vim.keymap.set('n', '<leader>sr', bultin.oldfiles, { desc = '[S]earch [R]ecent' })
		vim.keymap.set('n', '<leader>sb', bultin.buffers, { desc = '[S]earch [B]uffers' })
	end
}
