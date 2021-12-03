include("../day_2.jl")
using Test
using .Day2

dir_array = Day2.parse_file("day-2/tests/test-input.txt")

@testset "Day 2" begin
    @test dir_array == [("forward", 5),
    ("down", 5),
    ("forward", 8),
    ("up", 3),
    ("down", 8),
    ("forward", 2)]

    @test Day2.calc_position_depth(dir_array) == (15, 10)

    @test Day2.calc_position_aim_depth(dir_array) == (15, 10, 60)
end