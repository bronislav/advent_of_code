require 'minitest/autorun'

module Year2023
  module Day10
    class Part1Test < Minitest::Test
      SAMPLES = {
        '01' => 4,
        '02' => 8
      }.freeze

      include BaseTest
    end
  end
end
