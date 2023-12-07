require 'minitest/autorun'

module Year2023
  module Day03
    class Part1Test < Minitest::Test
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

        assert_equal 4361, Part1Solution.new(input).solve
      end

      def test_solves_when_part_number_in_begging_of_line
        input = <<~INPUT
          467..114..
          ...*......
        INPUT

        assert_equal 467, Part1Solution.new(input).solve
      end

      def test_solves_whne_part_number_in_end_of_line
        input = <<~INPUT
          ..35..633
          ......#..
        INPUT

        assert_equal 633, Part1Solution.new(input).solve
      end

      def test_solves_when_part_number_in_middle_of_line
        input = <<~INPUT
          617*......
          .....+.58.
          ..592.....
        INPUT

        assert_equal (617 + 592), Part1Solution.new(input).solve
      end

      def test_solves_when_symbol_in_middle_of_number_below
        input = <<~INPUT
          617......
          .*...+.58
        INPUT

        assert_equal 617, Part1Solution.new(input).solve
      end

      def test_solves_when_symbol_in_middle_of_number_above
        input = <<~INPUT
          ...*...+.58
          ..617......
        INPUT

        assert_equal 617, Part1Solution.new(input).solve
      end

      def test_solves_when_number_is_single_digit
        input = <<~INPUT
          ...*...+.58
          ...5.......
        INPUT

        assert_equal 5, Part1Solution.new(input).solve
      end

      def test_when_number_repeat_in_line
        input = <<~INPUT
          *..............................
          985*..........*......9....+....
          ....960....503.572......490....
        INPUT

        assert_equal (985 + 960 + 503 + 572 + 490), Part1Solution.new(input).solve
      end

      def test_solves_actual_input
        assert_equal 522_726, Part1Solution.new.solve
      end
    end
  end
end
