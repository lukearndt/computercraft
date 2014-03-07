args = { ... }

load_package("redstone_controller")

if args[1] == "" or args[2] == "" or args[3] == "" or args[4] == "" then
  error("Insufficient arguments provided. Arguments required: emit_length, emit_delay, side_count, side_1 (, side_2, side_3, etc)")
end

local emit_length = tonumber(args[1])
local emit_delay = tonumber(args[2])
local side_count = tonumber(args[3])
local sides = {}

for side = 4, side_count + 3, 1 do
  sides[side] = args[side]
end

redstone_timer(emit_length, emit_delay, side_count, sides)
