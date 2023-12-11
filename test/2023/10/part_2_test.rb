require 'minitest/autorun'

module Year2023
  module Day10
    class Part2Test < Minitest::Test
      SAMPLES = {
        '01' => 1,
        '02' => 1,
        '03' => 4,
        '04' => 4,
        '05' => 8,
        '06' => 10,
      }.freeze

      include BaseTest
    end
  end
end
