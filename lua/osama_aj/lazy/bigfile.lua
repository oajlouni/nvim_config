return {
    'LunarVim/bigfile.nvim',
    event = 'BufReadPre',
    opts = {
        filesize = 20, -- size in MiB
        features = {
            "treesitter",
            "lsp",
            --"syntax",
        }
    },
    config = function(_, opts)
        require('bigfile').setup(opts)
    end
}
