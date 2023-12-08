module Year2023
  module Day08
    class Part1Solution < BaseSolution
      def solve
        turns = chomped_lines[0].chars.map { |c| c == 'R' ? 1 : 0 }
        turns_enum = Enumerator.new do |y|
          loop { turns.each { |turn| y << turn } }
        end

        # puts "turns: #{turns_enum.take(20)}"

        rules = chomped_lines[2..].map do |line|
          rule = line.split(' = ')
          [rule.first, rule.last.scan(/\w+/)]
        end.to_h

        next_node = 'AAA'
        steps = 0
        while next_node != 'ZZZ' do
          # puts "#{next_node} -> #{rules[next_node]}"
          turn = turns_enum.next
          # puts "turn: #{turn}"
          next_node = rules[next_node][turn]
          # puts "next_node: #{next_node}"

          steps += 1
        end

        steps
      end
    end
  end
end
