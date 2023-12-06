module Year2023
  module Day02
    class Part1Solution < BaseSolution
      MAX_CUBES = {
        "red" => 12,
        "green" => 13,
        "blue" => 14,
      }.freeze

      def solve
        chomped_lines.map do |line|
          game_name, game_log = line.split(':')
          game_id = game_name.split(' ').last.to_i

          game_possible?(game_log) ? game_id : 0
        end.sum
      end

      private

      def game_possible?(game_log)
        game_log.split(';').all? do |round|
          round.split(',').all? do |rolled_cubes|
            count, color = rolled_cubes.split(' ')
            count.to_i <= MAX_CUBES[color]
          end
        end
      end
    end
  end
end
