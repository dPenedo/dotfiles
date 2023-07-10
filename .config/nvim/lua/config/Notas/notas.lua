local function new_md()
  -- Define the default directory to create the file in
  local default_directory = "/home/daniel/Documentos/Dropbox/Notas/"

  -- Prompt the user for the filename
  local file_name = vim.fn.input("Crear una nota: ")

  -- Create the file path
  local file_path = default_directory .. file_name .. ".md"

  -- Define the template to use for the new file
  local template = string.format(
    [[
# %s

##

### Tags:
    -
  ]],
    file_name
  )

  -- Create the new file
  local file = io.open(file_path, "w")
  if not file then
    print("Error: Unable to open file")
    return
  end
  file:write(template)
  file:close()

  -- Open the new file
  vim.cmd("e " .. file_path)
end

return { new_md = new_md }
