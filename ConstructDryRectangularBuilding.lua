load_package("turtle_construction")
load_package("turtle_destruction")

local function drill_previous_layer(inner_length, inner_width)
  forward(1)
  turn("right")
  forward(1)

  drill(2, "down")
  build("up")

  drill_rectangular_area(inner_length, inner_width)

  drill(1, "up")
  construct_up(1)

  forward(1)
  turn("right")
  forward(1)
  turn("right")
end

local function place_layer(inner_length, inner_width)
  construct_up(1)
  construct(inner_width + 1)
  local next_rotation = "right"
  for times = 1, inner_length + 1, 1 do
    build_row(next_rotation, inner_width + 1)
    if next_rotation == "right" then
      next_rotation = "left"
    else
      next_rotation = "right"
    end
  end
  turn("around")
end

local function construct_building(inner_length, inner_width, inner_height)
  place_layer(inner_length, inner_width)

  for times = 1, inner_height, 1 do
    place_layer(inner_length, inner_width)
    drill_previous_layer(inner_length, inner_width)
  end
end

local function initialize(horizontal_build_direction, inner_width)
  current_slot = 1
  if horizontal_build_direction == "l" then
    turn("left")
  elseif horizontal_build_direction == "r" then
    turn("left")
    reverse(inner_width + 1)
  else
    error("Invalid direction to build in. Please choose l or r.")
  end
end

print("Welcome to the dry rectangular building constructor.")

print("How long would you like the building to be (internally)?")
local inner_length = tonumber(read())

print("How wide would you like the building to be (internally)?")
local inner_width = tonumber(read())

print("How high would you like the walls to be (internally)?")
local inner_height = tonumber(read())

local material_buffer_required = 2 * ((inner_length + 2) * (inner_width + 2) + (inner_height * (inner_length + inner_width - 2)))

print("You will require " .. material_buffer_required .. " blocks to complete this operation.")

if material_buffer_required > (9 * 64) then
  print("WARNING: A completely full turtle will run out of material before this building is complete!")
else
  print("A completely full turtle should have enough materials to complete the building.")
end

print("Should I smash anything that gets in my way? y/n")
local smash_obstacles = read()

if smash_obstacles == "y" then
  turtle_destructive_movement_mode = true
else
  turtle_destructive_movement_mode = false
end

print("Should I build to the left or to the right? l/r")
local horizontal_build_direction = read()

print("Would you like to go ahead and construct the building? y/n")
local continue_confirmation = read()

if not continue_confirmation == "y" then error("Okie dokie, see you later!") end

initialize(horizontal_build_direction, inner_width)

construct_building(inner_length, inner_width, inner_height, horizontal_build_direction)

print("Done!")
