module Day5

    export parse_file, calc_number_crossings

    function parse_file(file_path)
        f = open(file_path)
        full_file = readlines(f)

        line_coords = [parse.(Int, match(r"(\d*),(\d*) -> (\d*),(\d*)", x).captures) for x in full_file]

        return transpose(hcat(line_coords...))
    end

    function calc_number_crossings(line_coords)
        # filter out any non-vertical/horizonal
        filtered_coords = line_coords[(line_coords[:,1] .== line_coords[:,3]) .| (line_coords[:,2] .== line_coords[:,4]),:]

        diagram = zeros(maximum(filtered_coords)+1,maximum(filtered_coords)+1)

        for i=1:size(filtered_coords)[1]
            min_x = min(filtered_coords[i,2], filtered_coords[i,4]) + 1
            max_x = max(filtered_coords[i,2], filtered_coords[i,4]) + 1

            min_y = min(filtered_coords[i,1], filtered_coords[i,3]) + 1
            max_y = max(filtered_coords[i,1], filtered_coords[i,3]) + 1

            diagram[
                min_x:max_x, # reversed here
                min_y:max_y] .+= 1

        end

        return sum(diagram .>= 2)
    end

   
end

line_coords = parse_file("day-5/puzzle-input.txt")
crossings = calc_number_crossings(line_coords)
println("Part 1 - number crossings: ", crossings)

