module Year2023
  module Day05
    class Part2Solution < BaseSolution
      def solve
        seeds, *mappings = chomped_lines.split("")

        seed_ranges = seeds[0].split(": ").last.split(" ").map(&:to_i).each_slice(2).map do |start, size|
          (start..(start + size - 1))
        end

        mappings.map! do |mapping|
          mapping[1..-1].map do |entry|
            to, from, size = entry.split(" ").map(&:to_i)

            [(from..(from + size - 1)), to - from]
          end
        end

        mappings.each do |mapper|
          seed_ranges = seed_ranges.flat_map do |seed_range|
            map_range(seed_range, mapper)
          end
        end

        seed_ranges.map(&:begin).min
      end

      private

      def map_range(range, mapper)
        if (match = mapper.find { |(mapping, _)| mapping.cover?(range) })
          _, offset = match
          [(range.begin + offset..range.end + offset)]
        elsif (match = mapper.find { |(mapping, _)| mapping.cover?(range.begin) })
          mapping, offset = match
          [(range.begin + offset..mapping.end + offset)] + map_range((mapping.end + 1..range.end), mapper)
        elsif (match = mapper.find { |(mapping, _)| mapping.cover?(range.end) })
          mapping, offset = match
          map_range((range.begin..mapping.begin - 1), mapper) + [(mapping.begin + offset..range.end + offset)]
        elsif (match = mapper.find { |(mapping, _)| range.cover?(mapping) })
          mapping, offset = match
          map_range((range.begin..(mapping.begin - 1)), mapper) + [(mapping.begin + offset..mapping.end + offset)] + map_range((mapping.end + 1..range.end), mapper)
        else
          [range]
        end.flatten
      end
    end
  end
end
