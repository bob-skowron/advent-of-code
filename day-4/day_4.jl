using LinearAlgebra

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

        marked_boards = boards * 0 # initialize marked_boards to 0        
        winning_board = Any
        winning_call = Any

        for c in called_numbers
            println(c)
            for b_i = 1:size(boards)[1]
                board = boards[b_i]
                marked_boards[b_i][board .== c] .= 1

                b = marked_boards[b_i]

                if (
                    maximum(sum(b, dims=1)) == 5 || # column sums
                    maximum(sum(b, dims=2)) == 5 # row sums
                )
                    winning_call = c

                    winning_board = board
                    unmarked_sum = sum(winning_board .* (1 .- b))
                    
                    return (winning_call, unmarked_sum)
                end
            end
        end        
    end

    # part 2

end


(called_numbers, boards) = parse_file("day-4/puzzle-input.txt")
(winning_call, unmarked_sum) = calc_boards(called_numbers, boards)
println("Part 1 - winning_call * unmarked_sum: ", winning_call * unmarked_sum)