module Year2023
  module Day14
    class Part1Solution < BaseSolution
      def solve
        moved = chomped_lines.map(&:chars).transpose.map do |row|
          old_row = row.dup

          move_left(row).tap do |new_row|
            # puts "#{old_row.join} =>> #{new_row}"
          end.chars
        end.transpose

        moved.each do |row|
          puts row.join
        end

        moved.each_with_index.map do |row, y|
          row.count('O') * (moved.size - y)
        end.sum
      end

      def move_left(row)
        square_rocks = []
        row.join.scan(/#/) { |_| square_rocks << Regexp.last_match.offset(0)[0] }

        if square_rocks.empty?
          move_rocks(row.sort).join
        else
          (0..square_rocks.size).map do |index|
            s = index == 0 ? 0 : square_rocks[index - 1] + 1
            f = index == square_rocks.size ? row.size : square_rocks[index]

            move_rocks(row[s..f])
          end.map(&:join).join
        end
      end

      def move_rocks(row_part)
        empty_spots = row_part.count('.')
        round_rocks = row_part.count('O')
        square_rocks = row_part.count('#')

        result = round_rocks > 0 ? ['O'] * round_rocks + ['.'] * empty_spots + ['#'] * square_rocks : row_part

        # puts "#{row_part.join} >>> #{result.join}"

        result
      end
    end
  end
end
