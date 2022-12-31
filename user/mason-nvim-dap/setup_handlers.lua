local debug_port = 5678
local host = "0.0.0.0"

return {
  python = function(source_name)
    local dap = require("dap")
    dap.adapters.python = {
      type = "server",
      host = host,
      port = tonumber(debug_port),
    }

    dap.configurations.python = {
      {
        type = "python",
        request = "attach",
        connect = {
          port = tonumber(debug_port),
          host = host,
        },
        mode = "remote",
        name = "Remote Attached Debugger",
        cwd = vim.fn.getcwd(),
        pathMappings = {
            {
              localRoot = vim.fn.getcwd(), -- Wherever your Python code lives locally.
              remoteRoot = "/app", -- Wherever your Python code lives in the container.
            };
        };
      },
    }
  end,
}
-- local session = dap.attach(host, tonumber(debug_port), pythonAttachConfig)
-- if session == nil then
--     io.write("Error launching adapter");
-- end
-- dap.repl.open()
