module AoC
  module Year2023
    module Day18
      PART_ONE = {
        # 'input' => 0,
        'sample_1' => 62,
      }.freeze

      PART_TWO = {
        # 'input' => 0,
        'sample_1' => 0,
      }.freeze

      class Solution < BaseSolution
        def part_one
          @ground = [['#']]
          @position = [0, 0]

          puts ''

          chomped_lines.each do |line|
            direction, length, _ = line.split(' ')

            length = length.to_i

            # puts "Moving #{direction} #{length} spaces"

            case direction
            when 'R'
              # puts "position: #{@position.inspect}"
              left_space = @ground[@position[0]].length - @position[1] - 1
              needed_space = left_space > length ? 0 : length - left_space
              # puts "Need #{needed_space} spaces"
              @ground.each { |row| needed_space.times { row << '.' } }

              length.times { @position[1] += 1; @ground[@position[0]][@position[1]] = '#' }
              # print_ground
            when 'L'
              needed_space = length - @position[1]
              needed_space = 0 if needed_space.negative?
              # puts "Need #{needed_space} spaces"

              @ground.each { |row| needed_space.times { row.unshift('.') } }
              @position[1] += needed_space

              length.times { @position[1] -= 1; @ground[@position[0]][@position[1]] = '#' }
              # print_ground
            when 'D'
              left_space = @ground.length - @position[0] - 1
              needed_space = left_space > length ? 0 : length - left_space
              # puts "Need #{needed_space} spaces"
              needed_space.times { @ground << Array.new(@ground[0].length, '.') }

              length.times { @position[0] += 1; @ground[@position[0]][@position[1]] = '#' }
              # print_ground
            when 'U'
              needed_space = length - @position[0]
              needed_space = 0 if needed_space.negative?
              # puts "Need #{needed_space} spaces"
              needed_space.times { @ground.unshift(Array.new(@ground[0].length, '.')) }
              @position[0] += needed_space

              length.times { @position[0] -= 1; @ground[@position[0]][@position[1]] = '#' }
              # print_ground
            end
          end

          print_ground

          @ground.map! do |row|
            inside = false

            puts row.join('')

            row.each_with_index.map do |char, index|
              # if !inside && !index.zero? && char == '#' && row[index - 1] == '.'
              #   inside = true
              # elsif inside && !index.zero? && char == '.' && row[index - 1] == '#'
              #   inside = false
              # end
              if (index.positive? && char == '.' && row[index - 1] == '#' && !inside) || (index.zero? && char == '#')
                inside = true
              elsif index.positive? && char == '#' && row[index - 1] == '.' && inside
                inside = false
              end

              inside ? '#' : char
            end.tap { puts row.join(''); puts '----------------------'; }
          end

          print_ground

          @ground.flatten.count('#')
        end

        def part_two
          raise NotImplementedError
        end

        def print_ground
          @ground.each do |row|
            puts row.join('')
          end
          puts '----------------------'
        end
      end
    end
  end
end
