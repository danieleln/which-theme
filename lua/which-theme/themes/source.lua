local options_pkg = require('which-theme.options')


-- main module
local M = {}


-- collections of configurations of each theme
local theme_configs = {}
-- flag that keeps track of config files being sourced
local config_files_already_sourced = false



-- returns configuration for all themes
M.getThemeConfigs = function(force_source)

    -- sources config files when force_source is true or when they
    -- haven't been sourced yet
    if force_source == true or config_files_already_sourced == false then
        M.sourceThemeConfigFiles()
    end


    return theme_configs
end



-- returns configuration for a specific theme
M.getThemeConfig = function(theme_name, force_source)
    -- retrieves config for theme 'theme_name'
    local theme_configs = M.getThemeConfigs(force_source)
    local theme_config  = theme_configs[theme_name]


    -- checks if theme 'theme_name' exists
    if theme_config == nil then
        -- TODO: raise an error
    end


    -- configures the theme. 'setup()' runs only once
    if type(theme_config.setup) == 'function' then
        theme_config.setup()
        theme_config.setup = nil
    end


    return theme_config
end



-- sources configuration files of all themes
M.sourceThemeConfigFiles = function()
    -- directory where theme config files are stored
    local themes_directory = options_pkg.getOption('themes_directory')


    for file in vim.fs.dir(themes_directory) do

        -- checks if file ends with '.lua'
        if file:match('.+%.lua') then

            -- absolute path
            local theme_file_path = themes_directory .. '/' .. file
            -- loads the file
            -- TODO: dofile inside a try catch or equivalent
            local theme_config      = dofile(theme_file_path)
            -- removes the extension '.lua'
            local theme_name      = string.sub(file, 1, #file-4)


            -- makes sure that theme_conf is properly written
            M.checkHealth(theme_conf)

            -- adds the new configuration to the collection
            theme_configs[theme_name] = theme_config
        end

    end


    -- config files have now been sourced
    config_files_already_sourced = true

end



M.checkHealth = function(theme_config)
    -- TODO: check if all parameters are properly written
end



return M
