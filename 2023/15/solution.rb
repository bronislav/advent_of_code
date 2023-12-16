module AoC
  module Year2023
    module Day15
      PART_ONE = {
        # 'input' => 0,
        'sample_1' => 1320
      }.freeze

      PART_TWO = {
        # 'input' => 0,
        'sample_1' => 145
      }.freeze

      class Solution < BaseSolution
        def part_one
          chomped_lines.flat_map do |line|
            line.split(',').map do |word|
              hash_string(word)
            end
          end.sum
        end

        def part_two
          boxes = Array.new(256) { [] }

          chomped_lines.each do |line|
            line.split(',').each do |word|
              label, operation, focal_length = word.match(/(?<label>\w+)(?<operation>[=-])(?<focal_length>\d+)?/).values_at(:label, :operation, :focal_length)

              box_index = hash_string(label)

              case operation
              when '='
                if (index = boxes[box_index].index { |box| box.start_with?(label) })
                  boxes[box_index][index] = "#{label} #{focal_length}"
                else
                  boxes[box_index] << "#{label} #{focal_length}"
                end
              when '-'
                boxes[box_index].reject! { |box| box.start_with?(label) }
              end

              puts "#{word} => #{box_index}"
              print_boxes(boxes)
            end
          end

          boxes.each_with_index.flat_map do |box, box_index|
            box.each_with_index.map do |lense, lense_index|
              power = lense.split(' ').last.to_i
              (box_index + 1) * (lense_index + 1) * power
            end
          end.sum
        end

        private

        def hash_string(string)
          string.chars.map(&:ord).inject(0) do |acc, val|
            (acc + val) * 17 % 256
          end
        end

        def print_boxes(boxes)
          boxes.each_with_index do |box, index|
            next if box.empty?

            puts "#{index}: #{box.join(', ')}"
          end
        end
      end
    end
  end
end
