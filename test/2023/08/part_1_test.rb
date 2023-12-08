require 'minitest/autorun'

module Year2023
  module Day08
    class Part1Test < Minitest::Test
      def test_solves_sample_input
        input = <<~INPUT
          RL
          
          AAA = (BBB, CCC)
          BBB = (DDD, EEE)
          CCC = (ZZZ, GGG)
          DDD = (DDD, DDD)
          EEE = (EEE, EEE)
          GGG = (GGG, GGG)
          ZZZ = (ZZZ, ZZZ)
        INPUT

        assert_equal 2, Part1Solution.new(input).solve
      end

      def test_solves_sample_input_2
        input = <<~INPUT
          LLR
          
          AAA = (BBB, BBB)
          BBB = (AAA, ZZZ)
          ZZZ = (ZZZ, ZZZ)
        INPUT

        assert_equal 6, Part1Solution.new(input).solve
      end

      def test_solves_actual_input
        assert_equal 20_659, Part1Solution.new.solve
      end
    end
  end
end
