require 'bundler'

Bundler.require

require_all 'lib'
require_all 'solutions/2023'
# require_all 'test/2023'

class App < Thor
  desc 'solve DAY PART', 'Run solution for a given day and part'
  def solve(day, part)
    puts "Solving day #{day} part #{part}..."

    Instrument.time do
      klazz = Object.const_get("Year2023::Day#{day.rjust(2, '0')}::Part#{part}Solution")
      input = File.read("input/2023/#{day.rjust(2, '0')}.txt")

      puts "Result: #{klazz.new(input).solve}"
    end
  end

  desc 'test DAY PART', 'Run tests for a given day and part'
  def test(day, part)
    puts "Testing day #{day} part #{part}..."

    require_relative "./test/2023/#{day.rjust(2, '0')}/part_#{part}_test.rb"
  end
end