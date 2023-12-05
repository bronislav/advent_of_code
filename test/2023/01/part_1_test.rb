require 'minitest/autorun'
require_relative '../../../solutions/2023/01/part_1'

module Year2023
  module Day01
    class Part1Test < Minitest::Test
      def test_solves_sample_input
        input = <<~INPUT
          1abc2
          pqr3stu8vwx
          a1b2c3d4e5f
          treb7uchet
        INPUT

        assert Part1Solution.new(input).solve == 142
      end
    end
  end
end