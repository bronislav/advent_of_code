module Year2023
  module Day02
    class Part2Solution < BaseSolution
      def solve
        chomped_lines.map do |line|
          game_name, game_log = line.split(':')
          game_id = game_name.split(' ').last.to_i

          game_power(game_log)
        end.sum
      end

      private

      def game_power(game_log)
        min_number_of_cubes = {
          'red' => 0,
          'green' => 0,
          'blue' => 0
        }

        game_log.split(';').each do |round|
          round.split(',').map do |rolled_cubes|
            count, color = rolled_cubes.split(' ')

            min_number_of_cubes[color] = count.to_i if count.to_i > min_number_of_cubes[color]
          end
        end

        min_number_of_cubes.values.reduce(:*)
      end
    end
  end
end
