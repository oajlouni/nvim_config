return {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Sets main module to use for opts

    -- [[ Configure Treesitter ]] See ':help nvim-treesitter'
    opts = {
        -- A list of parser names, or "all"
        ensure_installed = {
            "lua",
            "vimdoc",
            "javascript",
            "typescript",
            "jsdoc",
            "c",
            "cpp",
            "go",
            "rust",
            "python",
            "bash",
            "json",
            "xml",
            "html",
            "css",
            "cmake",
            "make",
        },

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
            enable = true,
            -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
            --  If you are experiencing weird indenting issues, add the language to
            --  the list of additional_vim_regex_highlighting and disabled languages for indent.
            additional_vim_regex_highlighting = { "ruby" },
        },

        indent = {
            enable = true,
            disable = { "ruby" },
        },

        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
    },
}
