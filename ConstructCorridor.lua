load_package("turtle_construction")

local function construct_side(corridor_length)
  construct(1)
  turn("right")
  construct(corridor_length - 1)
  turn("right")
  forward(1)
end

local function construct_layer(corridor_length)
  up(1)
  for sides = 1, 2, 1 do
    construct_side(corridor_length)
  end
end

local function construct_corridor(corridor_height, corridor_length)
  for height = 1, corridor_height + 1, 1 do
    construct_layer(corridor_length)
  end

  turn("right")
  down(2)
  construct_overhead(corridor_length - 1)

  clear_linear_water(corridor_height - 1, corridor_length, "back")
end

local function initialize()
  turtle.select(1)
  turtle.refuel()
  turtle.select(2)

  current_slot = 2

  turn("left")
end

print("Welcome to the corridor constructor.")

print("How high would you like the corridor to be?")
local corridor_height = tonumber(read())

print("How long would you like the corridor to be?")
local corridor_length = tonumber(read())

print("Shall I go ahead with these settings? y/n")
local go_ahead = read()

if not go_ahead == "y" then error("Okie dokie, see you later then!") end

initialize()

construct_corridor(corridor_height, corridor_length)

print("Done!")