module Year2023
  module Day14
    class Part2Solution < BaseSolution
      extend Memoist

      def solve
        orig_grid = chomped_lines.map(&:chars)

        grid = orig_grid.dup

        cache = {}

        (1..1_000_000_000).each do |i|
          grid = move_east(move_south(move_west(move_north(grid))))

          if (cached = cache[grid.flatten.join])
            cycle_size = i - cache[grid.flatten.join]

            puts "Found cycle of size #{cycle_size} at #{i}"

            iter = (1_000_000_000 - cached) % cycle_size

            grid = cache.find do |_, v|
              v == cached + iter
            end.first.chars.each_slice(orig_grid.first.size).to_a

            return count_load(grid)
          else
            cache[grid.flatten.join] = i
          end
        end
      end

      def count_load(grid)
        grid.each_with_index.map do |row, y|
          row.count('O') * (grid.size - y)
        end.sum
      end

      def move_north(grid)
        grid.transpose.map do |row|
          move_left(row)
        end.transpose
      end

      def move_south(grid)
        grid.transpose.map do |row|
          move_left(row.reverse).reverse
        end.transpose
      end

      def move_west(grid)
        grid.map do |row|
          move_left(row)
        end
      end

      def move_east(grid)
        grid.map do |row|
          move_left(row.reverse).reverse
        end
      end

      memoize def move_left(row)
        square_rocks = []
        row.join.scan(/#/) { |_| square_rocks << Regexp.last_match.offset(0)[0] }

        if square_rocks.empty?
          move_rocks(row.sort)
        else
          (0..square_rocks.size).flat_map do |index|
            s = index.zero? ? 0 : square_rocks[index - 1] + 1
            f = index == square_rocks.size ? row.size : square_rocks[index]

            move_rocks(row[s..f])
          end
        end
      end

      memoize def move_rocks(row_part)
        empty_spots = row_part.count('.')
        round_rocks = row_part.count('O')
        square_rocks = row_part.count('#')

        round_rocks.positive? ? ['O'] * round_rocks + ['.'] * empty_spots + ['#'] * square_rocks : row_part
      end
    end
  end
end
