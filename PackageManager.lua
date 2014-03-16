-- Should be run on startup

local function pastebin_identifier(package_name)
  identifier = ""
  if package_name == "turtle_movement" then
    identifier = "7eNVAY2P"
  elseif package_name == "turtle_construction" then
    identifier = "0pERW4vA"
  elseif package_name == "turtle_destruction" then
    identifier = "k5i9e06t"
  elseif package_name == "redstone_controller" then
    identifier = "UeBVf26j"
  elseif package_name == "redstone_timer_cli" then
    identifier = "placeholder"
  elseif package_name == "redstone_timer_ui" then
    identifier = "placeholder"
  elseif package_name == "construct_circular_building" then
    identifier = "qn3hGMNZ"
  elseif package_name == "destroy_circular_building" then
    identifier = "Uhfft8zV"
  elseif package_name == "construct_corridor" then
    identifier = "VtGTjXzg"
  elseif package_name == "construct_dry_circular_building" then
    identifier = "FGbmCdn8"
  elseif package_name == "construct_dry_rectangular_building" then
    identifier = "x8xNzSr3"
  elseif package_name == "construct_rectangular_chimney" then
    identifier = "TVKkT2sS"
  else
    error("Invalid package name")
  end
  return identifier
end

function execute(package_name)
  shell.run("rm " .. package_name)
  shell.run("pastebin get " .. pastebin_identifier(package_name) .. " " .. package_name)
  shell.run(package_name)
end

function load_package(package_name)
  execute(package_name)
end
