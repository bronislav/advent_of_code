# frozen_string_literal: true

module BaseTest
  def self.included(base)
    config = base::SAMPLES

    year, day, part = base.name.to_s
                          .match(/Year(?<year>\d+).+Day(?<day>\d+).+Part(?<part>\d)/)
                          &.values_at(:year, :day, :part)
                          &.map(&:to_i)

    config.each_with_index do |(sample, expected), index|
      define_method :"test_sample_#{index + 1}" do
        input = File.read(File.join(Dir.pwd, "input/#{year}/#{day}/sample_#{sample}"))
        klazz = Object.const_get("Year#{year}::Day#{day}::Part#{part}Solution")

        assert_equal expected, klazz.new(input).solve
      end
    end
  end
end