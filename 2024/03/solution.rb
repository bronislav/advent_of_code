module AoC
  module Year2023
    module Day03
      PART_ONE = {
        'sample_1' => 161
      }.freeze

      PART_TWO = {
        'sample_2' => 48
      }.freeze

      class Solution < BaseSolution
        def part_one
          chomped_lines.reduce(0) do |acc, line|
            line.scan(/mul\((\d+,\d+)?\)/).each do |a|
              acc += a[0].split(',').reduce(1) { |acc, b| acc * b.to_i }
            end
            acc
          end
        end

        def part_two
          enabled = true
          chomped_lines.reduce(0) do |acc, line|
            line.scan(/(mul|do|don't)\((\d+,\d+)?\)/).each do |a, b|
              if a == 'mul'
                acc += b.split(',').reduce(1) { |acc, b| acc * b.to_i } if enabled
              elsif a == 'do'
                enabled = true
              elsif a == 'don\'t'
                enabled = false
              end
            end
            acc
          end
        end
      end
    end
  end
end
