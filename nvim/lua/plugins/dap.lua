return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"

      require("nvim-dap-virtual-text").setup()

      -- Debug Adapters
      dap.adapters = {
        ["pwa-node"] = {
          type = "server",
          host = "::1",
          port = "${port}",
          executable = {
            command = "js-debug-adapter",
            args = {
              "${port}",
            },
          },
        },
      }

      -- Debug Configurations
      for _, language in ipairs({ "typescript", "javascript" }) do
        -- js-debug-adapter options:
        -- https://github.com/microsoft/vscode-js-debug/blob/main/OPTIONS.md
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to process ID",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Local NestJS (port 9229)",
            address = "localhost",
            port = 9229,
            cwd = "${workspaceFolder}",
            restart = true,
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "ZTO - Dockerised NestJS (port 9229)",
            address = "localhost",
            port = 9229,
            localRoot = "${workspaceFolder}",
            remoteRoot = "usr/src/app",
            -- resolveSourceMapLocations = { '${workspaceFolder}/dist', '!**/node_modules/**' },
            restart = true,
          },
        }
      end

      vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

      require("dapui").setup({
        -- Set icons to characters that are more likely to work in every terminal.
        --    Feel free to remove or use ones that you like more! :)
        --    Don't feel like these are good choices.
        icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
        controls = {
          icons = {
            pause = "⏸",
            play = "▶",
            step_into = "⏎",
            step_over = "⏭",
            step_out = "⏮",
            step_back = "b",
            run_last = "▶▶",
            terminate = "⏹",
            disconnect = "⏏",
          },
        },
      })

      local nmap = function(keys, func, desc)
        if desc then
          desc = 'DAP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { desc = desc })
      end

      nmap('<leader>db', dap.toggle_breakpoint, "Toggle [B]reakpoint")
      nmap('<leader>dB', dap.toggle_breakpoint, "Toggle Conditional [B]reakpoint")

      nmap('<leader>ds', dap.continue, "[S]tart/Continue Debugger")
      nmap('<leader>di', dap.step_into, "Step [I]nto")
      nmap('<leader>dv', dap.step_over, "Step O[v]er")
      nmap('<leader>do', dap.step_out, "Step [O]ut")
      -- nmap('<leader>d', dap.step_back, "")
      nmap('<leader>dr', dap.restart, "[R]estart Debugger")
      nmap('<space>dc', dap.run_to_cursor, "Run to [C]ursor")

      -- Eval var under cursor
      nmap('<leader>de', function()
        require("dapui").eval(nil, { enter = true })
      end, "[E]xamine Variable Under Cursor")

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
