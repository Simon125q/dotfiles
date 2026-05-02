return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 800
    end,
    opts = {
        -- your config comes here
        -- or leave it empty to use the default
    },
}

 
