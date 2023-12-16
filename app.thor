# frozen_string_literal: true
require 'bundler'

Bundler.require

require 'fileutils'

require_all 'lib'
# require_all 'solutions/2023'

class App < Thor
  desc 'solve DAY PART', 'Run solution for a given day and part'
  def solve(day, part)
    puts "Solving day #{day} part #{part}..."
    day_str = day.rjust(2, '0')
    base_path = File.join(Dir.pwd, "2023/#{day_str}")

    require_relative "#{base_path}/solution"

    Instrument.time do
      clazz = Object.const_get("AoC::Year2023::Day#{day_str}::Solution")

      input = File.read(File.join(base_path, 'input', 'input'))

      puts "Result: #{clazz.new(input).send(part == '1' ? :part_one : :part_two)}"
    end
  end

  desc 'test DAY PART', 'Run tests for a given day and part'
  def test(day, part)
    day_str = day.rjust(2, '0')
    base_path = File.join(Dir.pwd, "2023/#{day_str}")

    require_relative "#{base_path}/solution"

    clazz = Object.const_get("AoC::Year2023::Day#{day_str}::Solution")
    tests = Object.const_get("AoC::Year2023::Day#{day_str}").const_get("PART_#{part == '1' ? 'ONE' : 'TWO'}")

    tests.each do |input, expected_result|
      message = "Testing input #{input}..."
      print message

      Instrument.time do
        result = clazz.new(File.read(File.join(base_path, 'input', "#{input}"))).send(part == '1' ? :part_one : :part_two)

        if result == expected_result
          puts ' ' * (30 - message.size) + 'Passed!'.colorize(:green)
        else
          puts ' ' * (30 - message.size) + "Failed! Expected #{expected_result}, got #{result}".colorize(:red)
        end
      end
    end
  end

  desc 'setup DAY', 'Setup a new day'
  def setup(day)
    day_str = day.rjust(2, '0')

    base_path = File.join(Dir.pwd, "2023/#{day_str}")

    FileUtils.mkdir_p("#{base_path}/input")

    FileUtils.touch("#{base_path}/input/input")
    FileUtils.touch("#{base_path}/input/sample_01")
    FileUtils.touch("#{base_path}/input/sample_02")

    File.open("#{base_path}/solution.rb", 'w') do |file|
      file.write(<<~RUBY)
        module AoC
          module Year2023
            module Day#{day_str}
              PART_ONE = {
                'input' => 0,
                'sample_01' => 0,
                'sample_02' => 1
              }.freeze

              PART_TWO = {
                'input' => 0,
                'sample_01' => 0,
                'sample_02' => 1
              }.freeze

              class Solution < BaseSolution
                def part_one
                  raise NotImplementedError
                end

                def part_two
                  raise NotImplementedError
                end
              end
            end
          end
        end
      RUBY
    end
  end
end