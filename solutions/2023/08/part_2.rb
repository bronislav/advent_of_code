module Year2023
  module Day08
    class Part2Solution < BaseSolution
      def solve
        turns = chomped_lines[0].chars.map { |c| c == 'R' ? 1 : 0 }
        turns_enum = Enumerator.new do |y|
          loop { turns.each { |turn| y << turn } }
        end

        rules = chomped_lines[2..].map do |line|
          rule = line.split(' = ')
          [rule.first, rule.last.scan(/\w+/)]
        end.to_h

        current_nodes = rules.keys.select { |entry| entry.end_with?('A') }

        current_nodes.reduce(1) do |acc, current_node|
          steps = 0

          until current_node.end_with?('Z') do
            steps += 1
            current_node = rules[current_node][turns_enum.next]
          end

          acc.lcm(steps)
        end
      end
    end
  end
end
