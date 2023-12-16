module Year2023
  module Day15
    class Part1Solution < BaseSolution
      def solve
        chomped_lines.flat_map do |line|
          line.split(',').map do |word|
            hash_string(word)
          end
        end.sum
      end

      def hash_string(string)
        string.chars.map(&:ord).inject(0) do |acc, val|
          (acc + val) * 17 % 256
        end
      end
    end
  end
end
