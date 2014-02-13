load_package("redstone_controller")

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

local function redstone_timer(emit_length, emit_delay, side_count, sides)
  while true do
    emit_redstone_on_sides(side_count, sides)
    print("Waiting for " .. emit_length .. " seconds")
    sleep(emit_length)
    stop_redstone_on_sides(side_count, sides)
    print("Waiting for " .. emit_delay .. " seconds")
    sleep(emit_delay)
  end
end

print("How long would you like to emit for each cycle?")
local emit_length = tonumber(read())

print("How long should each cycle be, end to end?")
local emit_delay = tonumber(read()) - emit_length

local sides = {}
print("How many sides would you like to emit on?")
local side_count = tonumber(read())

for side = 1, side_count, 1 do
  print("Please specify side number " .. side)
  sides[side] = read()
end

redstone_timer(emit_length, emit_delay, sides)
