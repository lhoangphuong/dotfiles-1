require('Comment').setup({
    padding = true,
    sticky = true,
    ignore = nil,
    mappings = {
        basic = true,
        extra = true,
        extended = false,
    },
    toggler = {
        line = 'gcc',
        block = 'gbc',
    },
    opleader = {
        line = 'gc',
        block = 'gb',
    },
    pre_hook = nil,
    post_hook = nil,
})
local ft = require('Comment.ft')

ft.set('dart', {'// %s', '/*%s*/'})
