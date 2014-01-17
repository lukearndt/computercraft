while true do
  print("Initiating cast")
  redstone.setOutput("back", true)
  redstone.setOutput("right", true)
  sleep(13)
  redstone.setOutput("back", false)
  redstone.setOutput("right", false)
  sleep(2)
end