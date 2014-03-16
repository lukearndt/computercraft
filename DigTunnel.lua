load_package("turtle_destruction")
load_package("input_validation")

local function up_or_down(distance)
  if depth > 0 then
    return "up"
  elseif depth < 0 then
    return "down"
  else
    return false
  end
end

local function carve_slope(distance)
  for verticality = 1, distance, 1 do
    smash(4, "forward")
    drill(1, up_or_down(distance))
  end
end

local function conclude_spiral(distance)
  position = direction % 9

  if position % 2 == 0 then
    drill(1, "forward")
  end

  turn("right")
  drill(1, "forward")

  if position == 1 or position == 8 then
    turn("around")
  elseif position == 2 or position == 3 then
    turn("right")
  elseif position == 6 or position == 7 then
    turn("left")
  end

  smash(4, "up")
end

local function carve_spiral(distance)
  for verticality = 1, distance, 1 do
    drill(1, "forward")
    drill(1, up_or_down(distance))
    smash(4, "up")
    if verticality % 2 == 1 then
      turn("right")
    end
  end
end

local function traverse_vertically(distance, traversal_method)
  if traversal_method == "slope" then
    carve_slope(distance)
  elseif traversal_method == "shaft" then
    drill(distance, up_or_down(distance))
  elseif traversal_method == "spiral" then
    carve_spiral(distance)
  else
    error("Invalid traversal_method:" .. traversal_method)
  end
end

local function dig_tunnel(tunnel_depth, start_depth, length, height, width, descend_method, double_ended_tunnel, finish_depth, ascend_method)
  already_traversed = traverse_vertically(tunnel_depth - start_depth, descend_method)

  if double_ended_tunnel == "y" and ascend_method == "slope" then
    actual_tunnel_length = length - already_traversed - (finish_depth - tunnel_depth)
  else
    actual_tunnel_length = length - already_traversed
  end

  tunnel(actual_tunnel_length, width, height)

  traverse_vertically(finish_depth - tunnel_depth, ascend_method)
end

local function valid_ascend_descend()
  valid_read({ "slope", "shaft", "spiral" })
end

print("Welcome to the tunnel digger.")

print("What depth would you like the tunnel to be built at?")
local tunnel_depth = valid_number

print("What depth am I at right now?")
local start_depth = valid_number

print("How long would you like the tunnel to be?")
local length = valid_number

print("How high would you like the tunnel to be?")
local height = valid_number

print("How wide would you like the tunnel to be?")
local width = valid_number

print("How would you like me to get down there? slope/shaft/spiral")
local descend_method = valid_ascend_descend

print("Should I tunnel upward at the other end? y/n")
local double_ended_tunnel = valid_yes_no

print("What depth should I finish at at the other end?")
local finish_depth = valid_number

if double_ended_tunnel == "y" then
  print("How would you like me to get back up there? slope/shaft/spiral")
  local ascend_method = valid_ascend_descend
end

print("Shall I go ahead with these settings? y/n")
local go_ahead = valid_yes_no

if not go_ahead == "y" then error("Okie dokie, see you later then!") end

dig_tunnel(tunnel_depth, start_depth, length, height, width, descend_method, double_ended_tunnel, finish_depth, ascend_method)

print("Done!")
