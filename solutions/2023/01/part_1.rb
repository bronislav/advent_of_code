module Year2023
  module Day01
    class Part1Solution < BaseSolution
      def solve
        chomped_lines.map do |line|
          digits = line.scan(/\d/)
          digits.first.to_i * 10 + digits.last.to_i
        end.sum
      end
    end
  end
end
