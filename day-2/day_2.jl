
f = open("day-2/puzzle-input.txt")
lines = readlines(f)

dir_array = [(split(x, " ")[1], parse(Int64, split(x, " ")[2]))  for x in lines]

# part 1
horizontal_position = sum([x[2] * (x[1] == "forward") for x in dir_array])
depth = sum([x[2] * (x[1] == "up" ? -1 : (x[1] == "down" ? 1 : 0)) for x in dir_array])

print("Depth x Horizonal Position: ", horizontal_position*depth)

# part 2
function calc_position_aim_depth(dir_array)
    (horizontal_position, aim, depth) = (0,0,0)
    for (dir, val) in dir_array
        if dir == "forward"
            horizontal_position += val
            depth += (aim * val)
        elseif dir == "down"
            aim += val
        elseif dir == "up"
            aim -= val
        else
            println("whoops")
        end
    end

    return (horizontal_position, aim, depth)
end

(horizontal_position, aim, depth) = calc_position_aim_depth(dir_array)
print("Depth x Horizonal Position: ", horizontal_position*depth)