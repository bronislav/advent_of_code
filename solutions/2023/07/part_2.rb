module Year2023
  module Day07
    class Part2Solution < BaseSolution
      CARD_ORDER = %w[J 2 3 4 5 6 7 8 9 T Q K A].freeze

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
        groups = hand.chars.group_by(&:itself).transform_values(&:count)
        num_j = groups.delete("J") || 0
        values = groups.values.length > 0 ? groups.values.sort.reverse : [0]
        values[0] += num_j

        case values.max
        when 5
          return 7
        when 4
          return 6
        when 3
          return values[1] == 2 ? 5 : 4
        when 2
          return values[1] == 2 ? 3 : 2
        else
          return 1
        end
      end
    end
  end
end
