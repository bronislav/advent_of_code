require 'minitest/autorun'

module Year2023
  module Day12
    class Part1Test < Minitest::Test
      SAMPLES = {
        '01' => 21,
        '02' => 7118
      }.freeze

      include BaseTest
    end
  end
end
