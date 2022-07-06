local hop = require('hop')
local hint_char1 = hop.hint_char1

local opts = { noremap = true, silent = true }
vim.keymap.set('', 'f', function()
	hint_char1({ direction = require 'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })
end, opts)
vim.keymap.set('', 'F',
	function()
		hint_char1({ direction = require 'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })
	end
	, opts)
vim.keymap.set('', 't',
	function()
		hint_char1({ direction = require 'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
	end
	, opts)
vim.keymap.set('', 'T',
	function()
		hint_char1({ direction = require 'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
	end
	, opts)

hop.setup { keys = 'etovxqpdygfblzhckisuran' }
