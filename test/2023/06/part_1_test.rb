require 'minitest/autorun'

module Year2023
  module Day06
    class Part1Test < Minitest::Test
      def test_solves_sample_input
        input = <<~INPUT
          Time:      7  15   30
          Distance:  9  40  200 
        INPUT

        assert_equal 288, Part1Solution.new(input).solve
      end

      def test_solves_actual_input
        assert_equal 588_588, Part1Solution.new.solve
      end
    end
  end
end
