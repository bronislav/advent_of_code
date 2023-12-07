require 'minitest/autorun'

module Year2023
  module Day03
    class Part2Test < Minitest::Test
      def test_solves_sample_input
        input = <<~INPUT
          467..114..
          ...*......
          ..35..633.
          ......#...
          617*......
          .....+.58.
          ..592.....
          ......755.
          ...$.*....
          .664.598..
        INPUT

        assert_equal 467_835, Part2Solution.new(input).solve
      end

      def test_solves_actual_input
        assert_equal 81_721_933, Part2Solution.new.solve
      end
    end
  end
end
