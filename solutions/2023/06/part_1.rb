module Year2023
  module Day06
    class Part1Solution < BaseSolution
      def solve
        times = read_numbers(chomped_lines[0])
        distances = read_numbers(chomped_lines[1])

        times.zip(distances).map do |race_time, distance|
          (0..race_time).step(1).sum do |holding_time|
            could_win?(holding_time, race_time, distance) ? 1 : 0
          end
        end.reduce(:*)
      end

      private

      def read_numbers(line)
        line.scan(/\d+/).map(&:to_i)
      end

      def could_win?(holding_time, race_time, record_distance)
        distance = (race_time - holding_time) * holding_time

        distance > record_distance
      end
    end
  end
end
