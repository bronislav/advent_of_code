require 'minitest/autorun'

module Year2023
  module Day14
    class Part1Test < Minitest::Test
      SAMPLES = {
        '01' => 136,
        # '02' => 7118
      }.freeze

      include BaseTest
    end
  end
end
