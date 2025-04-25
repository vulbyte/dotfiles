--this is a section for global variables. use this for stuff you wanna save
--in memory each time you load nvim

vim.g.python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.11/bin/python3'


-- Set a global variable
vim.api.nvim_set_var('printLoadingAndLoaded', false)

local printLoadingAndLoaded = vim.g.printLoadingAndLoaded;

--warnings either way:
if (printLoadingAndLoaded == true) then
    print("printLoadingAndLoaded == true, disable by setting to false")
end
if (printLoadingAndLoaded == false) then
    print("printLoadingAndLoaded == false, enable by setting to true")
end

if (printLoadingAndLoaded == true) then
    io.write('LOADING: ./nvim/init.lua')
end

-- yepp
require('vulbyte.init')

vim.g.OmniSharp_server_use_net6 = 0
vim.g.OmniSharp_server_use_net7 = 0
vim.g.OmniSharp_server_use_net8 = 0

vim.g.OmniSharp_server_use_mono = 1

--io.write("\27[31m\n++++++++++++++o+++++++++++++++LOADED: ./nvim/init.lua\n\27[0m")

if (printLoadingAndLoaded == true) then
    print("nLOADED: ./nvim/init.lua")
end

---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup {
    ensure_installed = { 'gdscript', 'godot_resource', 'gdshader'},
    auto_install = true,
    highelight = {enable = true},
    indent = {enable = true},
}

require('lspconfig').gdscript.setup{
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}

vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

-- harper_ls config
local harper_ls = require('lspconfig')

harper_ls.harper_ls.setup {
    settings = {
        ["harper-ls"] = {
            linters = {
                spell_check = true,
                spelled_numbers = false,
                an_a = true,
                sentence_capitalization = false, -- Set this to `false` if you want to disable the warning
                unclosed_quotes = true,
                wrong_quotes = false,
                long_sentences = true,
                repeated_words = true,
                spaces = false,
                matcher = true,
                correct_number_suffix = true,
                number_suffix_capitalization = true,
                multiple_sequential_pronouns = true,
                linking_verbs = false,
                avoid_curses = true,
                terminating_conjunctions = true,
            }
        }
    }
}

return printLoadingAndLoaded

