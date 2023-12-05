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

        assert_equal 142, Part1Solution.new(input).solve
      end

      def test_solves_actual_input
        input = File.read(File.expand_path('../../../../input/2023/01.txt', __FILE__))

        assert_equal 55538, Part1Solution.new(input).solve
      end
    end
  end
end