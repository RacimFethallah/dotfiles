vim.pack.add({
    "https://github.com/nvim-mini/mini.ai",
    "https://github.com/nvim-mini/mini.surround",
    "https://github.com/nvim-mini/mini.clue",
    "https://github.com/nvim-mini/mini.pairs",
    'https://github.com/nvim-mini/mini.icons',
    'https://github.com/nvim-mini/mini.files',
    'https://github.com/nvim-mini/mini.indentscope',
    'https://github.com/nvim-mini/mini.tabline',
})

require("mini.ai").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require('mini.icons').setup()
require('mini.files').setup()
require('mini.indentscope').setup()
require('mini.tabline').setup()

vim.keymap.set('n', '<leader>e', function()
	MiniFiles.open()
end, { desc = 'Explorer' })

local miniclue = require("mini.clue")

miniclue.setup({
    window = {
        delay = 200,

        config = {
            width = "auto",
            anchor = "SE",
            row = "auto",
            col = "auto",
        },
    },

    triggers = {
        -- Leader
        { mode = { "n", "x" }, keys = "<Leader>" },

        -- Built-in motions
        { mode = "n", keys = "[" },
        { mode = "n", keys = "]" },
        { mode = { "n", "x" }, keys = "g" },
        { mode = { "n", "x" }, keys = "z" },

        -- Marks
        { mode = { "n", "x" }, keys = "'" },
        { mode = { "n", "x" }, keys = "`" },

        -- Registers
        { mode = { "n", "x" }, keys = '"' },
        { mode = { "i", "c" }, keys = "<C-r>" },

        -- Window commands
        { mode = "n", keys = "<C-w>" },

        -- Insert completion
        { mode = "i", keys = "<C-x>" },
    },

    clues = {
        -----------------------------------------------------------------------
        -- Leader groups
        -----------------------------------------------------------------------

        { mode = "n", keys = "<Leader>b", desc = "+Buffer" },
        { mode = "n", keys = "<Leader>c", desc = "+Code" },
        { mode = "n", keys = "<Leader>f", desc = "+Find" },
        { mode = "n", keys = "<Leader>g", desc = "+Git" },
        { mode = "n", keys = "<Leader>l", desc = "+LSP" },
        { mode = "n", keys = "<Leader>p", desc = "+Plugins" },
        { mode = "n", keys = "<Leader>q", desc = "+Quit" },
        { mode = "n", keys = "<Leader>s", desc = "+Search" },
        { mode = "n", keys = "<Leader>t", desc = "+Terminal" },
        { mode = "n", keys = "<Leader>u", desc = "+UI" },
        { mode = "n", keys = "<Leader>w", desc = "+Window" },

        -----------------------------------------------------------------------
        -- Built-in clues
        -----------------------------------------------------------------------

        miniclue.gen_clues.square_brackets(),
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),

        miniclue.gen_clues.windows({
            submode_move = true,
            submode_navigate = true,
            submode_resize = true,
        }),

        miniclue.gen_clues.z(),
    },
})
