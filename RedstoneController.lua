function redstone_on(side)
  print("Enabling redstone output on side: " .. side)
  redstone.setOutput(side, true)
end

function redstone_off(side)
  print("Disabling redstone output on side: " .. side)
  redstone.setOutput(side, false)
end

local function emit_redstone_on_sides(side_count, sides)
  for side = 1, side_count, 1 do
    redstone_on(sides[side])
  end
end

local function stop_redstone_on_sides(side_count, sides)
  for side = 1, side_count, 1 do
    redstone_off(sides[side])
  end
end

function redstone_timer(emit_length, emit_delay, side_count, sides)
  while true do
    emit_redstone_on_sides(side_count, sides)
    print("Waiting for " .. emit_length .. " seconds")
    sleep(emit_length)
    stop_redstone_on_sides(side_count, sides)
    print("Waiting for " .. emit_delay .. " seconds")
    sleep(emit_delay)
  end
end
