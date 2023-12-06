# frozen_string_literal: true

require 'minitest/autorun'

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
        assert_equal 55_538, Part1Solution.new.solve
      end
    end
  end
end