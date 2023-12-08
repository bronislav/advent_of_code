module Year2023
  module Day06
    class Part2Solution < BaseSolution
      def solve
        race_time = read_number(chomped_lines[0])
        distance = read_number(chomped_lines[1])

        (0..race_time).step(1).sum do |holding_time|
          could_win?(holding_time, race_time, distance) ? 1 : 0
        end
      end

      private

      def read_number(line)
        line.scan(/\d+/).join.to_i
      end

      def could_win?(holding_time, race_time, record_distance)
        distance = (race_time - holding_time) * holding_time

        distance > record_distance
      end
    end
  end
end
