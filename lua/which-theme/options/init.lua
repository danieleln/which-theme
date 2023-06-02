
-- which-theme options
local options = require('which-theme.options.default')


local M = {}


-- initializes which-theme options
M.loadWhichThemeOptions = function(opts)

    -- checks if options are ok
    M.checkHealth(opts)

    -- updates package options
    options = opts
end



-- checks if options are correctly written
M.checkHealth = function(options)
    -- no need to check options if they're nil
    if options == nil then
        return
    end



    -- TODO: check options
    -- check that options are a table, otherwise error!


    return options
end



-- retrieves a property from which-theme options
M.get = function(property)

    if property == 'themes_directory' then
        local themes_directory = options['themes_directory']
        local nvim_config_dir  = vim.fn.stdpath('config') .. '/'


        -- checks if themes_directory is a directory
        if vim.fn.isdirectory(themes_directory) == 1 then
            return themes_directory
        end

        -- checks if themes_directory is inside of the nvim config directory
        if vim.fn.isdirectory(nvim_config_dir .. themes_directory) == 1 then
            return nvim_config_dir .. themes_directory
        end

        -- TODO: raise error, themes_directory can't be found!

    end


    return options[property]
end





return M
