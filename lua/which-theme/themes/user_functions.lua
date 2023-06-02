local themes_source_pkg = require('which-theme.themes.source')


local M = {}
local current_theme = {
    name  = nil,
    style = nil,
    transparent_background = false
}



M.loadTheme = function(theme_name, theme_style)
    theme_style = theme_style or ''

    if type(theme_name) ~= 'string' then
        -- TODO: raise an error
    end

    -- retrieves config for theme 'theme_name'
    theme_config = themes_source_pkg.getThemeConfig(theme_name)

    -- TODO: check if theme has style

    -- sets the transparent mode
    if type(theme_config.transparentBackground) == 'function' then
        theme_config.transparentBackground(
            current_theme.transparent_background)

    elseif current_theme.transparent_background == true then
        -- TODO: 'error message' vs set highlights colors?
        vim.print(theme_name .. ' does not support transparent background')
    end


    -- loads the theme
    if type(theme_config.load) == 'function' then
        theme_config.load(theme_style)
    else
        -- TODO: how to manage styles?
        vim.cmd.colorscheme(theme_name .. '-' .. theme_style)
    end


    -- updates the current theme
    current_theme.name  = theme_name
    current_theme.style = theme_style
end



M.reloadTheme = function()
    -- reload theme if present
    if current_theme.name ~= nil then
        M.loadTheme(current_theme.name, current_theme.style)
    end
end



M.enableTransparentBackground = function()
    current_theme.transparent_background = true

    M.reloadTheme()
end



M.disableTransparentBackground = function()
    current_theme.transparent_background = false

    M.reloadTheme()
end



M.toggleTransparentBackground = function()
    current_theme.transparent_background =
        not current_theme.transparent_background

    M.reloadTheme()
end




return M
