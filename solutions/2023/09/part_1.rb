module Year2023
  module Day09
    class Part1Solution < BaseSolution
      def solve
        chomped_lines.map do |line|
          numbers = line.split.map(&:to_i)

          current_numbers = numbers.dup
          stack = [current_numbers]
          differences = []
          while true do
            differences = current_numbers.each_cons(2).map { |a, b| b - a }
            if differences.all? { |entry| entry == 0 }
              break
            else
              stack.push(differences)
              current_numbers = differences
            end
          end

          current_differences = differences.push(0)
          while stack.any? do
            current_numbers = stack.pop
            current_numbers.push(current_numbers.last + current_differences.last)
            current_differences = current_numbers
          end

          current_numbers.last
        end.sum
      end
    end
  end
end
