module AoC
  module Year2023
    module Day16
      PART_ONE = {
        # 'input' => 0,
        'sample_1' => 46
      }.freeze

      PART_TWO = {
        # 'input' => 0,
        'sample_1' => 0
      }.freeze

      class Solution < BaseSolution
        extend Memoist

        def part_one
          @grid = chomped_lines.map(&:chars)
          propagate([0, 0], [0, 1])

          @energized.flatten.count('#')
        end

        def part_two
          raise NotImplementedError
        end

        private

        def propagate((cur_r, cur_c), (dir_r, dir_c))
          @energized ||= Array.new(@grid.size) { Array.new(@grid.first.size) { '.' } }

          new_directions([dir_r, dir_c], @grid[cur_r][cur_c]).each do |(new_dir_r, new_dir_c)|
            @energized[cur_r][cur_c] = '#'

            n_r = cur_r + new_dir_r
            n_c = cur_c + new_dir_c

            puts "cur: #{cur_r}, #{cur_c} | new: #{n_r}, #{n_c} | dir: #{new_dir_r}, #{new_dir_c}"
            print_energized
            puts "--------------------"

            next unless within_grid?(n_r, n_c)

            propagate([n_r, n_c], [new_dir_r, new_dir_c])
          end
        end

        def print_energized
          puts ''
          @energized.each_with_index do |row, index|
            puts [@grid[index].join, row.join].join('     ')
          end
        end

        memoize def new_directions((dir_r, dir_c), cell)
          case cell
          when '|'
            if dir_c.zero?
              [[dir_r, 0]]
            else
              [[1, 0], [-1, 0]]
            end
          when '-'
            if dir_r.zero?
              [[0, dir_c]]
            else
              [[0, 1], [0, -1]]
            end
          when '/'
            [[dir_c * -1, dir_r * -1]]
          when '\\'
            [[dir_c, dir_r]]
          else
            [[dir_r, dir_c]]
          end
        end

        memoize def within_grid?(row, col)
          row >= 0 && row < @grid.size && col >= 0 && col < @grid.first.size
        end
      end
    end
  end
end
