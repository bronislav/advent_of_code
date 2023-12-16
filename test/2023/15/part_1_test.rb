require 'minitest/autorun'

module Year2023
  module Day15
    class Part1Test < Minitest::Test
      SAMPLES = {
        '01' => 1320,
        # '02' => 7118
      }.freeze

      include BaseTest
    end
  end
end
