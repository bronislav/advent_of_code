require 'minitest/autorun'
require_relative '../../../solutions/2023/01/part_1'

module Year2023
  module Day01
    class Part2Test < Minitest::Test
      def test_solves_sample_input
        input = <<~INPUT
          two1nine
          eightwothree
          abcone2threexyz
          xtwone3four
          4nineeightseven2
          zoneight234
          7pqrstsixteen
        INPUT

        assert_equal 281, Part2Solution.new(input).solve
      end

      def test_solves_when_words_repeat
        input = <<~INPUT
          oneone
        INPUT

        assert_equal 11, Part2Solution.new(input).solve
      end

      def test_solves_when_words_overlap
        input = <<~INPUT
          oneight
        INPUT

        assert_equal 18, Part2Solution.new(input).solve
      end

      def test_solves_actual_input
        input = File.read(File.expand_path('../../../input/2023/01.txt', __dir__))

        assert_equal 54_875, Part2Solution.new(input).solve
      end
    end
  end
end