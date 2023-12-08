require 'active_support/all'

module Year2023
  module Day05
    class Part1Solution < BaseSolution
      def solve
        seeds, *maps = chomped_lines.split("")

        seeds = seeds[0].split(": ").last.split(" ").map(&:to_i)

        maps = maps.map do |map_data|
          map_data[1..-1].map do |entry|
            entry.split(" ").map(&:to_i) # [to, from, size]
          end
        end

        maps.each do |map|
          seeds.map! do |seed_id|
            matching_entry = map.find { |entry| seed_id >= entry[1] && seed_id < entry[1] + entry[2] }

            matching_entry ? (matching_entry[0] + seed_id - matching_entry[1]) : seed_id
          end
        end

        seeds.min
      end
    end
  end
end
