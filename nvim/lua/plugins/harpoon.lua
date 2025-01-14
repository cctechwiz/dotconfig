return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      local harpoon = require("harpoon")

      local nmap = function(keys, func, desc)
        if desc then
          desc = 'Harpoon: ' .. desc
        end

        vim.keymap.set('n', keys, func, { desc = desc })
      end

      harpoon:setup()

      nmap("<leader>ha", function() harpoon:list():add() end, 'Add to Harpoon List')
      nmap("<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, 'Open Harpoon List')

      nmap("<leader>h1", function() harpoon:list():select(1) end, 'Goto Harpoon Item 1')
      nmap("<leader>h2", function() harpoon:list():select(2) end, 'Goto Harpoon Item 2')
      nmap("<leader>h3", function() harpoon:list():select(3) end, 'Goto Harpoon Item 3')
      nmap("<leader>h4", function() harpoon:list():select(4) end, 'Goto Harpoon Item 4')

      -- Toggle previous & next buffers stored within Harpoon list
      nmap("<leader>hn", function() harpoon:list():prev() end, '[H]arpoon [N]ext Item')
      nmap("<leader>hp", function() harpoon:list():next() end, '[H]arpoon [P]revious Item')

      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end

      vim.keymap.set("n", "<leader>fp", function()
        toggle_telescope(harpoon:list())
      end, { desc = "Telescope: [F]ind Har[p]oon" })

      harpoon:extend({
        UI_CREATE = function(cx)
          vim.keymap.set("n", "<C-v>", function()
            harpoon.ui:select_menu_item({ vsplit = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-x>", function()
            harpoon.ui:select_menu_item({ split = true })
          end, { buffer = cx.bufnr })
        end,
      })
    end,
  }
}
