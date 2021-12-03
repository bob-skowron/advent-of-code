module Day2

    export parse_file, calc_position_depth, calc_position_aim_depth

    function parse_file(file_path)
        f = open(file_path)
        lines = readlines(f)    

        dir_array = [(split(x, " ")[1], parse(Int64, split(x, " ")[2]))  for x in lines]

        return dir_array
    end

    # part 1
    function calc_position_depth(dir_array)
        horizontal_position = sum([x[2] * (x[1] == "forward") for x in dir_array])
        depth = sum([x[2] * (x[1] == "up" ? -1 : (x[1] == "down" ? 1 : 0)) for x in dir_array])

        return (horizontal_position, depth)
    end

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
end


dir_array = Day2.parse_file("day-2/puzzle-input.txt")

(horizontal_position, depth) = Day2.calc_position_depth(dir_array)
print("Part1 - Depth x Horizonal Position: ", horizontal_position*depth)

(horizontal_position, aim, depth) = Day2.calc_position_aim_depth(dir_array)
print("\nPart 2 - Depth x Horizonal Position: ", horizontal_position*depth)
