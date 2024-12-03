module AoC
  module Year2023
    module Day02
      PART_ONE = {
        # 'input' => 0,
        'sample_1' => 2,
      }.freeze

      PART_TWO = {
        # 'input' => 0,
        'sample_1' => 4,
      }.freeze

      class Solution < BaseSolution
        def part_one
          chomped_lines.map { |line| line.split(' ').map(&:to_i) }.count do |line|
            verify_jumps(line)
          end
        end

        def part_two
          chomped_lines.map { |line| line.split(' ').map(&:to_i) }.count do |line|
            verify_jumps(line) ||
              (0..line.size - 1).any? { |i| l = line.dup; l.delete_at(i); verify_jumps(l) }
          end
        end

        private

        def verify_jumps(line)
          pairs = line[0..-2].zip(line.rotate(1)[0..-2])
          pairs.all? { |a, b| a - b > 0 && a - b <= 3 } || pairs.all? { |a, b| b - a > 0 && b - a <= 3 }
        end
      end
    end
  end
end
