module Year2023
  module Day11
    class Part1Solution < BaseSolution
      extend Memoist

      def solve
        empty_rows = []

        @grid = chomped_lines.each_with_index.map do |line, index|
          empty_rows << index if line.chars.uniq.count == 1
          line.chars
        end

        empty_cols = col_range.select do |col|
          row_range.all? { |row| @grid[row][col] == '.' }
        end

        # count galaxies
        positions = []
        @grid.each_with_index do |row, row_index|
          row.each_with_index do |col, col_index|
            positions << [row_index, col_index] if @grid[row_index][col_index] == '#'
          end
        end

        # @grid.each do |row|
        #   puts row.join
        # end

        positions.each_with_index.flat_map do |a_pos, a_index|
          positions.each_with_index.map do |b_pos, b_index|
            next if b_index <= a_index

            distance = a_pos.zip(b_pos).map { |a, b| (a - b).abs }.sum

            additional_rows = empty_rows.count { |row| row.between?(*[a_pos.first, b_pos.first].sort) }
            additional_cols = empty_cols.count { |col| col.between?(*[a_pos.last, b_pos.last].sort) }

            # puts "#{a_index + 1} (#{a_pos.inspect}) : #{b_index + 1} (#{b_pos}) = #{distance} + #{additional_rows} + #{additional_cols}"

            distance + (additional_rows + additional_cols) * (1_000_000 - 1)
          end.compact
        end.sum
      end

      memoize def row_range
        0...@grid.length
      end

      memoize def col_range
        0...@grid.first.length
      end
    end
  end
end
