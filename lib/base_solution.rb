class BaseSolution
  def initialize(input)
    @input = input
  end

  def solve
    raise NotImplementedError
  end

  private

  def chomped_lines
    input.split("\n").map(&:chomp)
  end

  attr_reader :input
end