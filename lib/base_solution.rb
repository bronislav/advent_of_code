# frozen_string_literal: true
class BaseSolution
  def initialize(input = nil)
    @input = input || File.read(input_path)
  end

  def solve
    raise NotImplementedError
  end

  private

  attr_reader :input

  def chomped_lines
    input.split("\n").map(&:chomp)
  end

  def input_path
    year, day = self.class.name.to_s
                    .match(/Year(?<year>\d+).+Day(?<day>\d+)/)
                    &.values_at(:year, :day)

    base_path = File.join(Dir.pwd, "input/#{year}/#{day}")
    puts "base_path: #{base_path}, dir?: #{File.directory?(base_path)}"
    File.directory?(base_path) ? File.join(base_path, 'input') : "#{base_path}.txt"
  end
end
