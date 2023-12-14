module Year2023
  module Day13
    class Part1Solution < BaseSolution
      def solve
        chomped_lines.split('').map do |pattern|
          puts "Pattern:"
          pattern.each do |line|
            puts line
          end

          p(find_symmetry(pattern) * 100 + find_symmetry(pattern.map(&:chars).transpose.map(&:join)))
        end.sum
      end

      def find_symmetry(problem)
        (1..problem.size).each do |i|
          puts "Index #{i}"
          number_of_rows = [i, problem.size - i].min
          puts "Number of rows #{number_of_rows}"

          return number_of_rows if print_problem(problem[0, number_of_rows]) == print_problem(problem[number_of_rows, number_of_rows].reverse)
        end

        0
      end

      def print_problem(lines)
        puts "Problem:"

        lines.each do |line|
          puts line
        end

        lines
      end
    end
  end
end
