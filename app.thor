# frozen_string_literal: true
require 'bundler'

Bundler.require

require 'fileutils'

require_all 'lib'
require_all 'solutions/2023'

class App < Thor
  desc 'solve DAY PART', 'Run solution for a given day and part'
  def solve(day, part)
    puts "Solving day #{day} part #{part}..."

    Instrument.time do
      clazz = Object.const_get("Year2023::Day#{day.rjust(2, '0')}::Part#{part}Solution")
      input = File.read("input/2023/#{day.rjust(2, '0')}.txt")

      puts "Result: #{clazz.new(input).solve}"
    end
  end

  desc 'test DAY PART', 'Run tests for a given day and part'
  def test(day, part)
    puts "Testing day #{day} part #{part}..."

    require_relative "./test/2023/#{day.rjust(2, '0')}/part_#{part}_test.rb"
  end

  desc 'new DAY', 'Create a new day'
  def new(day)
    puts "Creating day #{day}..."

    day_str = day.rjust(2, '0')

    FileUtils.mkdir_p("solutions/2023/#{day_str}")
    FileUtils.mkdir_p("test/2023/#{day_str}")

    FileUtils.touch("input/2023/#{day_str}.txt")

    (1..2).each do |part|
      File.open("solutions/2023/#{day.rjust(2, '0')}/part_#{part}.rb", 'w') do |file|
        file.write(<<~RUBY)
          module Year2023
            module Day#{day.rjust(2, '0')}
              class Part#{part}Solution < BaseSolution
                def solve
                  raise NotImplementedError
                end
              end
            end
          end
        RUBY
      end

      File.open("test/2023/#{day_str}/part_#{part}_test.rb", 'w') do |file|
        file.write(<<~RUBY)
          require 'minitest/autorun'

          module Year2023
            module Day#{day_str}
              class Part#{part}Test < Minitest::Test
                def test_solves_sample_input
                  input = <<~INPUT
                  INPUT

                  # assert_equal <>, Part#{part}Solution.new(input).solve
                end

                def test_solves_actual_input
                  # assert_equal <>, Part#{part}Solution.new.solve
                end
              end
            end
          end
        RUBY
      end
    end
  end
end