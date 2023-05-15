-- prevents loading which-theme twice
if vim.g.loaded_which_theme then
    return
end


-- ex-commands
vim.api.nvim_create_user_command(
    'WhichTheme',
    function()

    end,
    { nargs = 0 }
)


vim.g.loaded_which_theme = true
