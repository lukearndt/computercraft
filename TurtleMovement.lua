function turn(direction)
  print("Turning " .. direction)
  if direction == "left" then
    turtle.turnLeft()
  elseif direction == "right" then
    turtle.turnRight()
  elseif direction == "around" then
    turtle.turnRight()
    turtle.turnRight()
  else
    error("invalid direction to turn")
  end
end

function smash_block_and_move(direction)
  if direction == "forward" then
    turtle.dig()
    success_is_still = turtle.forward()
  elseif direction == "up" then
    turtle.digUp()
    success_is_still = turtle.up()
  elseif direction == "down" then
    turtle.digDown()
    success_is_still = turtle.down()
  elseif direction == "back" then
    turn("around")
    turtle.dig()
    turn("around")
    success_is_still = turtle.back()
  else
    error("invalid direction to smash block and move: " .. direction)
  end
  if success_is_still == false then
    error("unable to move " .. direction .. ", even after smashing it")
  end
end

function move(direction, times)
  print ("Moving " .. direction .. " " .. times .. " spaces")
  local success = false

  for count = 1, times, 1 do
    if direction == "forward" then
      success = turtle.forward()
    elseif direction == "back" then
      success = turtle.back()
    elseif direction == "up" then
      success = turtle.up()
    elseif direction == "down" then
      success = turtle.down()
    else
      error("invalid direction to move")
    end

    if not success then
      if turtle_destructive_movement_mode == true then
        smash_block_and_move(direction)
      else
        error("unable to move in direction: " .. direction)
      end
    end
  end
end

function reverse(times)
  move("back", times)
end

function forward(times)
  move("forward", times)
end

function up(times)
  move("up", times)
end

function down(times)
  move("down", times)
end

function clear_linear_water(height, length, initial_direction)
  direction = initial_direction
  for passes = 1, height, 1 do
    move(direction, length)
    down(1)

    if direction == "forward" then
      direction = "back"
    else
      direction = "forward"
    end
  end
end