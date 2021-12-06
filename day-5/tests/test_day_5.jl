include("../day_5.jl")
using Test
using .Day5

line_coords = Day5.parse_file("day-5/tests/test-input.txt")

@testset "Day 5" begin
    @test line_coords ==  [
        0 9 5 9;
        8 0 0 8;
        9 4 3 4;
        2 2 2 1;
        7 0 7 4;
        6 4 2 0;
        0 9 2 9;
        3 4 1 4;
        0 0 8 8;
        5 5 8 2;
    ]

    @test Day5.calc_number_crossings(line_coords) == 5

    @test Day5.calc_number_crossings_with_diags(line_coords) == 12
end