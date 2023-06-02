local user_fn_pkg = require('which-theme.themes.user_functions')
local config_pkg  = require('which-theme.themes.config')
local source_pkg  = require('which-theme.themes.source')


local M = {}



-- internal functions ---------------------------------------------------
M.sourceThemeConfigFiles = source_pkg.sourceThemeConfigFiles
-------------------------------------------------------------------------


-- user functions -------------------------------------------------------
M.loadTheme                    = user_fn_pkg.loadTheme

M.disableTransparentBackground = user_fn_pkg.disableTransparentBackground

M.enableTransparentBackground  = user_fn_pkg.enableTransparentBackground

M.toggleTransparentBackground  = user_fn_pkg.toggleTransparentBackground
-------------------------------------------------------------------------


return M
