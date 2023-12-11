require 'minitest/autorun'

module Year2023
  module Day11
    class Part2Test < Minitest::Test
      SAMPLES = {
        '01' => 4,
        '02' => 8
      }.freeze

      include BaseTest
    end
  end
end
