require 'minitest/autorun'

module Year2023
  module Day10
    class Part1Test < Minitest::Test
      def test_solves_sample_input
        input = <<~INPUT
          .....
          .S-7.
          .|.|.
          .L-J.
          .....
        INPUT

        assert_equal 4, Part1Solution.new(input).solve
      end

      def test_solves_sample_input_2
        input = <<~INPUT
          ..F7.
          .FJ|.
          SJ.L7
          |F--J
          LJ...
        INPUT

        assert_equal 8, Part1Solution.new(input).solve
      end

      def test_solves_actual_input
        assert_equal 6690, Part1Solution.new.solve
      end
    end
  end
end
