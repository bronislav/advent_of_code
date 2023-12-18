module AoC
  module Year2023
    module Day17
      PART_ONE = {
        # 'input' => 0,
        'sample_1' => 102,
      }.freeze

      PART_TWO = {
        'input' => 0,
        'sample_1' => 0,
      }.freeze

      class Solution < BaseSolution
        def part_one
          @grid = chomped_lines.map { |line| line.chars.map(&:to_i) }
          @cur_min = @grid.flatten.sum

          puts ""

          propagate([0,0], [0, 1], 0, 1, Array.new(@grid.size) { Array.new(@grid.first.size) { 0 } })
          propagate([0,0], [1, 0], 0, 1, Array.new(@grid.size) { Array.new(@grid.first.size) { 0 } })

          @cur_min
        end

        def part_two
          raise NotImplementedError
        end

        private

        def propagate((cur_r, cur_c), (dir_r, dir_c), heat_loss, steps, visited)
          puts "cur: #{cur_r}, #{cur_c} | dir: #{dir_r}, #{dir_c} | heat_loss: #{heat_loss} | steps: #{steps}"

          if heat_loss > @cur_min || visited[cur_r][cur_c] == 1
            print "heat_loss ??: #{heat_loss}"
            print_visited(visited)
            return
          end

          if cur_r == @grid.size - 1 && cur_c == @grid.first.size - 1
            @cur_min = heat_loss if heat_loss < @cur_min
            print "reached end: #{heat_loss}"
            print_visited(visited)

            return
          end

          directions = dir_r.zero? ? [[1, 0], [-1, 0]] : [[0, 1], [0, -1]]

          directions.each do |(new_dir_r, new_dir_c)|
            n_r = cur_r + new_dir_r
            n_c = cur_c + new_dir_c

            next unless within_grid?(n_r, n_c)

            dupl = visited.dup
            dupl[n_r][n_c] = 1
            propagate([n_r, n_c], [new_dir_r, new_dir_c], heat_loss + @grid[n_r][n_c], 1, dupl)
          end

          if steps < 2
            n_r = cur_r + dir_r
            n_c = cur_c + dir_c

            dupl = visited.dup
            dupl[n_r][n_c] = 1

            propagate([n_r, n_c], [dir_r, dir_c], heat_loss + @grid[n_r][n_c], steps + 1, dupl) if within_grid?(n_r, n_c)
          end
        end

        def within_grid?(r, c)
          r >= 0 && r < @grid.size && c >= 0 && c < @grid.first.size
        end

        def print_visited(visited)
          puts ''
          visited.each_with_index do |row, index|
            puts [@grid[index].join, row.join].join('     ')
          end
        end
      end
    end
  end
end
