# frozen_string_literal: true

module Year2023
  module Day10
    class Part1Solution < BaseSolution
      extend Memoist

      def solve
        start = nil
        @grid = chomped_lines.each_with_index.map do |line, x|
          line.chars.tap do |row|
            y = row.index('S')
            start = [x, y] if y
          end
        end

        possible_directions = directions.select do |dir, allowed_nodes|
          grid(move(start, dir)).in?(allowed_nodes)
        end.keys

        cur_dir = possible_directions.first
        cur_pos = move(start, cur_dir)

        distance = 1
        while cur_pos != start
          distance += 1
          cur_dir = transform[[cur_dir, grid(cur_pos)]]
          cur_pos = move(cur_pos, cur_dir)
        end

        distance / 2
      end

      def grid((x, y))
        return '.' unless x.in?(x_range) && y.in?(y_range)

        @grid[x][y]
      end

      memoize def x_range
        (0...@grid.size)
      end

      memoize def y_range
        (0...@grid.first.size)
      end

      def move((x, y), (dx, dy))
        [x+dx, y+dy]
      end

      memoize def directions
        {
          right => '-7J',
          down => '|LJ',
          left => '-FL',
          up => '|F7'
        }
      end

      memoize def right
        [0, 1]
      end

      memoize def down
        [1, 0]
      end

      memoize def left
        [0, -1]
      end

      memoize def up
        [-1, 0]
      end

      memoize def transform
        {
          [right, '-'] => right,
          [right, '7'] => down,
          [right, 'J'] => up,
          [left, '-'] => left,
          [left, 'F'] => down,
          [left, 'L'] => up,
          [down, '|'] => down,
          [down, 'L'] => right,
          [down, 'J'] => left,
          [up, '|'] => up,
          [up, 'F'] => right,
          [up, '7'] => left
        }
      end
    end
  end
end
