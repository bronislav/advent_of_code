module AoC
  module Year2023
    module Day01
      PART_ONE = {
        'input' => 55_538,
        'sample_01' => 142
      }.freeze

      PART_TWO = {
        'input' => 54_875,
        'sample_02' => 281,
      }.freeze

      class Solution < BaseSolution
        def part_one
          chomped_lines.map do |line|
            digits = line.scan(/\d/)
            digits.first.to_i * 10 + digits.last.to_i
          end.sum
        end

        def part_two
          pattern = WORDS.map { |word| "(#{word})" }.join('|')

          chomped_lines.map do |line|
            digits = line.scan(/(?<=#{pattern}|(\d))/).map(&:compact).flatten
            convert_word(digits.first) * 10 + convert_word(digits.last)
          end.sum
        end

        private

        WORDS = %w[zero one two three four five six seven eight nine].freeze

        def convert_word(word)
          if word.to_i.to_s == word
            word.to_i
          else
            WORDS.index(word)
          end
        end
      end
    end
  end
end