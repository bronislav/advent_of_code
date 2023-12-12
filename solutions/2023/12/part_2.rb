module Year2023
  module Day12
    class Part2Solution < BaseSolution
      extend Memoist

      def solve
        chomped_lines.map do |line|
          springs, numbers = line.split(' ')
          springs = ([springs] * 5).join('?')

          count_permutations(springs.chars, numbers.split(',').map(&:to_i) * 5)
        end.sum
      end

      memoize def count_permutations(springs, numbers)
        if numbers.empty?
          return springs.include?('#') ? 0 : 1
        end

        first, *rest = numbers

        total = 0

        (0..springs.length).each do |index|
          if index + first <= springs.length &&
            !springs[index, first].include?('.') &&
            (index.zero? || springs[index - 1] != '#') &&
            (index + first == springs.length || springs[index + first] != '#')

            total += count_permutations(springs[index + first + 1..] || [], rest)
          end

          break if springs[index] == '#'
        end

        total
      end
    end
  end
end
