module Year2023
  module Day04
    class Part2Solution < BaseSolution
      def solve
        number_of_cards = Array.new(chomped_lines.size, 1)

        chomped_lines.each_with_index do |line, index|
          wining_numbers, our_numbers = line.split(':').last.split('|').map do |str|
            str.scan(/\d+/).map(&:to_i)
          end

          number_of_winning_numbers = our_numbers.count { |num| wining_numbers.include?(num) }

          number_of_winning_numbers.times do |i|
            number_of_cards[index + i + 1] += number_of_cards[index]
          end
        end

        number_of_cards.sum
      end
    end
  end
end
