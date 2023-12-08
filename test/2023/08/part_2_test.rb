require 'minitest/autorun'

module Year2023
  module Day08
    class Part2Test < Minitest::Test
      def test_solves_sample_input
        input = <<~INPUT
          LR

          11A = (11B, XXX)
          11B = (XXX, 11Z)
          11Z = (11B, XXX)
          22A = (22B, XXX)
          22B = (22C, 22C)
          22C = (22Z, 22Z)
          22Z = (22B, 22B)
          XXX = (XXX, XXX)
        INPUT

        assert_equal 6, Part2Solution.new(input).solve
      end

      def test_solves_actual_input
        assert_equal 15_690_466_351_717, Part2Solution.new.solve
      end
    end
  end
end
