function redstone_on(side)
  print("Enabling redstone output on side: " .. side)
  redstone.setOutput(side, true)
end

function redstone_off(side)
  print("Disabling redstone output on side: " .. side)
  redstone.setOutput(side, false)
end
