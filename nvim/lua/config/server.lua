-- Start Nvim Server if in a Godot Project
-- Godot External Editor Settings:
-- Exec Path: 
-- Exec Flags: --server {project}/nvim-server.pipe --remote-send "<C-\><C-N>:e {file}<CR>:call cursor({line}+1,{col})<CR>"
if vim.loop.fs_stat("project.godot") then
  local pipepath = "./nvim-server.pipe"
  local stat_result = vim.loop.fs_stat(pipepath)
  if stat_result then
    local unlink_result, unlink_err = vim.loop.fs_unlink(pipepath)
    if not unlink_result then
      error("Failed to delete existing pipe file: " .. pipepath .. ". Error: " .. unlink_err)
    end
    print("Deleted existing pipe file: " .. pipepath)
  else
    print("No existing pipe file found.")
  end

  print("Starting Server. Listening on " .. pipepath)
  vim.fn.serverstart(pipepath)
end
