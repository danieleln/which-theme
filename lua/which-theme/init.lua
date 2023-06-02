local options_pkg = require('which-theme.options')
local themes_pkg  = require('which-theme.themes')
local window_pkg  = require('which-theme.window')
local utils_pkg   = require('which-theme.utils')



local M = {}


-- which-theme setup ---------------------------------------------------
M.setup = function(options)
    -- loads which-theme options
    options_pkg.loadWhichThemeOptions(options)

    -- sources config files for each theme
    themes_pkg.sourceThemeConfigFiles()
end
------------------------------------------------------------------------


-- popup window --------------------------------------------------------
M.openWindow   = window_pkg.openWindow

M.closeWindow  = window_pkg.closeWindow

M.toggleWindow = window_pkg.toggleWindow
------------------------------------------------------------------------


-- theme functions -----------------------------------------------------
M.enableTransparentBackground  = themes_pkg.enableTransparentBackground

M.disableTransparentBackground = themes_pkg.disableTransparentBackground

M.toggleTransparentBackground  = themes_pkg.toggleTransparentBackground

M.loadTheme                    = themes_pkg.loadTheme
------------------------------------------------------------------------


return M
