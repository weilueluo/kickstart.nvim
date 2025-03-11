return {
    {
        'rcarriga/nvim-notify',
        config = function()
            require('notify').setup {
                stages = 'fade_in_slide_out',
                timeout = 3000,
            }
            vim.notify = require 'notify' -- Set as the default notification handler
        end,
    },
}
