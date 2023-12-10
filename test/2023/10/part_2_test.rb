require 'minitest/autorun'

module Year2023
  module Day10
    class Part2Test < Minitest::Test
      def test_solves_sample_input_1_1
        input = <<~INPUT
          .....
          .S-7.
          .|.|.
          .L-J.
          .....
        INPUT

        assert_equal 1, Part2Solution.new(input).solve
      end

      def test_solves_sample_input_1_2
        input = <<~INPUT
          ..F7.
          .FJ|.
          SJ.L7
          |F--J
          LJ...
        INPUT

        assert_equal 1, Part1Solution.new(input).solve
      end

      def test_solves_sample_input
        input = <<~INPUT
          ...........
          .S-------7.
          .|F-----7|.
          .||.....||.
          .||.....||.
          .|L-7.F-J|.
          .|..|.|..|.
          .L--J.L--J.
          ...........
        INPUT

        assert_equal 4, Part2Solution.new(input).solve
      end

      def test_solves_sample_input_2
        input = <<~INPUT
          ..........
          .S------7.
          .|F----7|.
          .||....||.
          .||....||.
          .|L-7F-J|.
          .|..||..|.
          .L--JL--J.
          ..........
        INPUT

        assert_equal 4, Part2Solution.new(input).solve
      end

      def test_solves_sample_input_3
        input = <<~INPUT
          .F----7F7F7F7F-7....
          .|F--7||||||||FJ....
          .||.FJ||||||||L7....
          FJL7L7LJLJ||LJ.L-7..
          L--J.L7...LJS7F-7L7.
          ....F-J..F7FJ|L7L7L7
          ....L7.F7||L7|.L7L7|
          .....|FJLJ|FJ|F7|.LJ
          ....FJL-7.||.||||...
          ....L---J.LJ.LJLJ...
        INPUT

        assert_equal 8, Part2Solution.new(input).solve
      end

      def test_solves_sample_input_4
        input = <<~INPUT
          FF7FSF7F7F7F7F7F---7
          L|LJ||||||||||||F--J
          FL-7LJLJ||||||LJL-77
          F--JF--7||LJLJ7F7FJ-
          L---JF-JLJ.||-FJLJJ7
          |F|F-JF---7F7-L7L|7|
          |FFJF7L7F-JF7|JL---7
          7-L-JL7||F7|L7F-7F7|
          L.L7LFJ|||||FJL7||LJ
          L7JLJL-JLJLJL--JLJ.L
        INPUT

        assert_equal 10, Part2Solution.new(input).solve
      end

      def test_solves_actual_input
        # assert_equal <>, Part2Solution.new.solve
      end
    end
  end
end
