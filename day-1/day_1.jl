
module Day1

    export parse_file, calc_increase, calc_increase_window

    function parse_file(filename)
        f = open(filename)
        lines = readlines(f)
        
        return [parse(Int, x) for x in lines]
    end
            
    # part 1
    function calc_increase(int_array)
        diff_array = append!(int_array[2:end], int_array[end]) .- int_array

        return sum(diff_array .> 0)
    end

    # part 2 
    function calc_increase_window(int_array)
        window_array = int_array[1:end-2] .+ int_array[2:end-1] .+ int_array[3:end]
        window_diff_array = append!(window_array[2:end], window_array[end]) .- window_array
        return sum(window_diff_array .> 0)
    end
end

int_array = Day1.parse_file("day-1/puzzle-input.txt")
inc_count = Day1.calc_increase(int_array)
println("Part 1 - Number of increases: ", inc_count)

window_inc_count = Day1.calc_increase_window(int_array)
println("Par 2 - Number of window increases: ", window_inc_count)