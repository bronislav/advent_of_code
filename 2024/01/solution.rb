module AoC
  module Year2023
    module Day01
      PART_ONE = {
        'input' => 1197984,
        'sample_1' => 11,
        'sample_2' => 0
      }.freeze

      PART_TWO = {
        'input' => 0,
        'sample_1' => 31,
        'sample_2' => 0
      }.freeze

      class Solution < BaseSolution
        def part_one
          lists = [[], []]

          chomped_lines.each do |line|
            locs = line.split(' ').map(&:to_i)

            lists[0] << locs[0]
            lists[1] << locs[1]
          end

          lists.map!(&:sort)

          lists[0].zip(lists[1]).map { |a, b| (a - b).abs }.sum
        end

        def part_two
          lists = [[], []]

          chomped_lines.each do |line|
            locs = line.split(' ').map(&:to_i)

            lists[0] << locs[0]
            lists[1] << locs[1]
          end

          left = lists[0].sort
          right = lists[1].sort.group_by(&:itself).transform_values(&:size)

          left.map { |l| l * (right[l] || 0) }.sum
        end
      end
    end
  end
end
