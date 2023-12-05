module Year2023
  module Day01
    class Part2Solution < BaseSolution
      WORDS = %w(zero one two three four five six seven eight nine)

      def solve
        pattern = WORDS.map { |word| "(#{word})" }.join('|')

        chomped_lines.map do |line|
          digits = line.scan(/(?<=#{pattern}|(\d))/).map(&:compact).flatten
          convert_word(digits.first) * 10 + convert_word(digits.last)
        end.sum
      end

      private

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
