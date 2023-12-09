require 'minitest/autorun'

module Year2023
  module Day09
    class Part2Test < Minitest::Test
      def test_solves_sample_input
        input = <<~INPUT
          0 3 6 9 12 15
          1 3 6 10 15 21
          10 13 16 21 30 45
        INPUT

        assert_equal 2, Part2Solution.new(input).solve
      end

      def test_solves_actual_input
        # assert_equal <>, Part2Solution.new.solve
      end
    end
  end
end
