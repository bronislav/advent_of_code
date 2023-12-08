module Year2023
  module Day07
    class Part1Solution < BaseSolution
      CARD_ORDER = %w[2 3 4 5 6 7 8 9 T J Q K A].freeze

      def solve
        chomped_lines.map do |line|
          line.split(' ')
        end.map do |(hand, bid)|
          [[hand, bid], rank_hand(hand)]
        end.sort do |((a, _), a_rank), ((b, _), b_rank)|
          if a_rank == b_rank
            a_value = a.chars.map { |c| CARD_ORDER.index(c) }
            b_value = b.chars.map { |c| CARD_ORDER.index(c) }
            a_value <=> b_value
          else
            a_rank <=> b_rank
          end
        end.each_with_index.tap do |hs|
          # hs.each do |(hand, _), index|
          #   puts "#{index + 1}: #{hand.inspect}"
          # end
        end.reduce(0) do |acc, (hand, index)|
          # puts "#{index + 1}: #{hand.inspect}"
          acc + (index + 1) * hand[0][1].to_i
        end
      end

      private

      def rank_hand(hand)
        case hand.chars.group_by(&:itself).transform_values(&:count)
        when ->(g) { g.values == [5] }
          return 7
        when ->(g) { g.values.sort.reverse == [4, 1] }
          return 6
        when ->(g) { g.values.sort.reverse == [3, 2] }
          return 5
        when ->(g) { g.values.sort.reverse == [3, 1, 1] }
          return 4
        when ->(g) { g.values.sort.reverse == [2, 2, 1] }
          return 3
        when ->(g) { g.values.sort.reverse == [2, 1, 1, 1] }
          return 2
        else
          return 1
        end
      end
    end
  end
end
