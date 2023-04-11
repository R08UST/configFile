local M = {}
M.virtual = function()
    local present, dap = pcall(require, "dap")
    if present then
        vim.g.dap_virtual_text = true
    end
end

M.python = function()
    local present, dap = pcall(require, "dap")
    local present1, python = pcall(require, "dap-python")
    if present and present1 then
        python.setup("/usr/bin/python3")
    end
end

M.vimkind = function()
    local present, dap = pcall(require, "dap")
    -- if present then
    dap.configurations.lua = {
        {
            type = "nlua",
            request = "attach",
            name = "Attach to running Neovim instance",
            host = function()
                local value = vim.fn.input("Host [127.0.0.1]: ")
                if value ~= "" then
                    return value
                end
                return "127.0.0.1"
            end,
            port = function()
                local val = tonumber(vim.fn.input("Port: "))
                assert(val, "Please provide a port number")
                return val
            end
        }
    }
    dap.adapters.nlua = function(callback, config)
        callback({type = "server", host = config.host, port = config.port})
    end
end

M.ui = function()
    local present, dap = pcall(require, "dap")
    local present1, ui = pcall(require, "dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
        ui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        ui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        ui.close()
    end
    -- if present and present1 then
    ui.setup(
        {
            icons = {expanded = "▾", collapsed = "▸"},
            mappings = {
                -- Use a table to apply multiple mappings
                expand = {"<CR>", "<2-LeftMouse>"},
                open = "o",
                remove = "d",
                edit = "e",
                repl = "r"
            },
            layouts = {
                {
                    elements = {
                        "scopes",
                        "breakpoints",
                        "stacks",
                        "watches"
                    },
                    size = 40,
                    position = "left"
                },
                {
                    elements = {
                        "repl",
                        "console"
                    },
                    size = 10,
                    position = "bottom"
                }
            },
            floating = {
                max_height = nil, -- These can be integers or a float between 0 and 1.
                max_width = nil, -- Floats will be treated as percentage of your screen.
                mappings = {
                    close = {"q", "<Esc>"}
                }
            },
            windows = {indent = 1}
        }
    )
end
return M
