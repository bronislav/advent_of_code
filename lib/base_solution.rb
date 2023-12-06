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

    File.join(Dir.pwd, "input/#{year}/#{day}.txt")
  end
end
