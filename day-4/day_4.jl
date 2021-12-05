module Day4

    export parse_file, calc_position_depth, calc_position_aim_depth

    function parse_file(file_path)
        f = open(file_path)
        full_file = readlines(f)
        
        called_numbers = parse.(Int, split(full_file[1,1], ","))
        boards = []
        for i=3:6:size(full_file)[1]
            matrix = [split(x, " ", keepempty=false) for x in full_file[i:i+4,1]]
            int_matrix = transpose(parse.(Int, hcat(matrix...)))
            push!(boards, int_matrix)
        end
        
        return (called_numbers, boards)
    end

    # part 1
    function calc_boards(called_numbers, boards)

    end

    # part 2

end


(called_numbers, boards) = parse_file("day-4/tests/test-input.txt")
