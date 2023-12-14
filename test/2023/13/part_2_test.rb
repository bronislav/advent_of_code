require 'minitest/autorun'

module Year2023
  module Day13
    class Part2Test < Minitest::Test
      SAMPLES = {
        '01' => 21,
        # '02' => 7118
      }.freeze

      include BaseTest
    end
  end
end
