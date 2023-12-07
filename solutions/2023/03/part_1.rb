module Year2023
  module Day03
    class Part1Solution < BaseSolution
      def solve
        regexp = /[^\d\.]/

        chomped_lines.each_with_index.flat_map do |line, row|
          numbers = []

          line.scan(/\d+/) do |number|
            numbers << [number, Regexp.last_match.offset(0)[0]]
          end

          numbers.select do |number, index|
            x_range = (([index - 1, 0].max)..(index + number.length))

            (row >= 1 && chomped_lines[row - 1][x_range].match?(regexp)) ||
              (row < chomped_lines.length - 1 && chomped_lines[row + 1][x_range].match?(regexp)) ||
              line[x_range.begin]&.match?(regexp) ||
              line[x_range.end]&.match?(regexp)

          end.map(&:first).map(&:to_i)
        end.sum
      end
    end
  end
end
