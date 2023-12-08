require 'minitest/autorun'

module Year2023
  module Day07
    class Part1Test < Minitest::Test
      def test_solves_sample_input
        input = <<~INPUT
          32T3K 765
          T55J5 684
          KK677 28
          KTJJT 220
          QQQJA 483
        INPUT

        assert_equal 6_440, Part1Solution.new(input).solve
      end

      def test_solves_actual_input
        assert_equal 251_136_060, Part1Solution.new.solve
      end
    end
  end
end
