module Year2023
  module Day04
    class Part1Solution < BaseSolution
      def solve
        chomped_lines.flat_map do |line|
          wining_numbers, our_numbers = line.split(':').last.split('|').map do |str|
            str.scan(/\d+/).map(&:to_i)
          end

          number_of_wins = our_numbers.count { |num| wining_numbers.include?(num) }
          number_of_wins.positive? ? 2**(number_of_wins - 1) : 0
        end.sum
      end
    end
  end
end
