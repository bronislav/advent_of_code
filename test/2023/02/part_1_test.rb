require 'minitest/autorun'
require_relative '../../../solutions/2023/02/part_1'

module Year2023
  module Day02
    class Part1Test < Minitest::Test
      def test_solves_sample_input
        input = <<~INPUT
          Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
          Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
          Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
          Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
          Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
        INPUT

        assert_equal 8, Part1Solution.new(input).solve
      end

      def test_solves_actual_input
        input = File.read(File.expand_path('../../../input/2023/02.txt', __dir__))

        assert_equal 2528, Part1Solution.new(input).solve
      end
    end
  end
end
