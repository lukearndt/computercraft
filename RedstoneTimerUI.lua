load_package("redstone_controller")

print("How long would you like to emit for each cycle?")
local emit_length = tonumber(read())

if emit_length < 2 then
  error("I'm sorry, Dave. I can't let you lag the server like that.")
end

print("How long should each cycle be, end to end?")
local emit_delay = tonumber(read()) - emit_length

if emit_delay < 3 then
  error("I'm sorry, Dave. I can't let you lag the server like that.")
end

local sides = {}
print("How many sides would you like to emit on?")
local side_count = tonumber(read())

for side = 1, side_count, 1 do
  print("Please specify side number " .. side)
  sides[side] = read()
end

redstone_timer(emit_length, emit_delay, side_count, sides)
