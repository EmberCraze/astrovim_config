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
        port = tonumber(debug_port),
        host = host;
        name = "Remote Attached Debugger",
        mode = "remote",
        cwd = vim.fn.getcwd(),
        connect = {
          host = host,
        },
        pathMappings = {
            {
              localRoot = vim.fn.getcwd(), -- Wherever your Python code lives locally.
              remoteRoot = "/usr/src/app", -- Wherever your Python code lives in the container.
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
