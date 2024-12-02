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
    base_path = File.join(Dir.pwd, "2024/#{day_str}")

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
    base_path = File.join(Dir.pwd, "2024/#{day_str}")

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
    year = '2024'
    base_path = File.join(Dir.pwd, "#{year}/#{day_str}")

    FileUtils.mkdir_p("#{base_path}/input")

    # Write task input
    resp = http.get("/#{year}/day/#{day}/input", headers)
    File.write("#{base_path}/input/input", resp.body)

    # Write sample inputs
    resp = http.get("/#{year}/day/#{day}", headers)
    document = Nokogiri::HTML.parse(resp.body)
    document.css('pre code').each_with_index do |code, i|
      File.write("#{base_path}/input/sample_#{i + 1}", code.text)
    end

    File.open("#{base_path}/solution.rb", 'w') do |file|
      file.write(<<~RUBY)
        module AoC
          module Year2023
            module Day#{day_str}
              PART_ONE = {
                'input' => 0,
                'sample_1' => 0,
                'sample_2' => 0
              }.freeze

              PART_TWO = {
                'input' => 0,
                'sample_1' => 0,
                'sample_2' => 0
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

  no_commands do
    def headers
      @headers ||= {
        'Cookie' => File.read(File.join(Dir.pwd, 'cookies', 'advent_of_code')).chomp,
        'User-Agent' => 'https://github.com/bronislav/advent_of_code by anton@ilin.dn.ua'
      }
    end

    def http
      @http ||= Net::HTTP.start('adventofcode.com', 443, use_ssl: true)
    end
  end
end