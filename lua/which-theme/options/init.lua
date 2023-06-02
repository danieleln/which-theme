local M = {}


-- which-theme default options
local options = require('which-theme.options.default')


-- initializes which-theme options
M.loadWhichThemeOptions = function(opts)
    if opts == nil then
        return
    end

    -- checks if options are ok and updates them
    options = M.checkHealth(opts)
end



-- checks if options are correctly written
M.checkHealth = function(opts)
    -- TODO: check options
    -- check that options are a table, otherwise error!


    return opts
end



-- retrieves a property from which-theme options
M.getOption = function(property)

    -- TODO: create a 'normalize path' func with this code
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
