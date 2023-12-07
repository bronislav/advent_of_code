module Year2023
  module Day03
    class Part2Solution < BaseSolution
      def solve
        @numbers_map = {}

        chomped_lines.each_with_index do |line, row_index|
          numbers = []
          line.scan(/\d+/) do |number|
            numbers << [number, Regexp.last_match.offset(0)[0]]
          end

          numbers.each do |number, index|
            x_range = (([index - 1, 0].max)..(index + number.length))
            (@numbers_map[row_index] ||= []) << [x_range, number.to_i]
          end
        end

        chomped_lines.each_with_index.flat_map do |line, row_index|
          positions = []
          line.scan(/\*/) do |star|
            positions << Regexp.last_match.offset(0)[0]
          end

          positions.map do |position|
            if (parts = get_parts(position, row_index)).length == 2
              parts.first * parts.last
            else
              0
            end
          end
        end.sum
      end

      private

      def get_parts(position, row_index)
        (row_index - 1..row_index + 1).flat_map do |i|
          numbers = @numbers_map[i]
          next([]) unless numbers

          numbers.select { |range, _| range.include?(position) }.map(&:last)
        end
      end
    end
  end
end
