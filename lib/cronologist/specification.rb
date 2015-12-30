require "treetop"

Treetop.load File.join(File.dirname(__FILE__),'spec')

module Cronologist
  class Specification
    def initialize(spec_str)
      @spec_str = spec_str
      @spec_parser = SpecParser.new
      @spec_matcher = @spec_parser.parse(spec_str)
      unless @spec_matcher
        raise "Parse error: #{@spec_parser.failure_reason}"
      end
    end

    def matches?(time)
      @spec_matcher.matches?(time)
    end
    alias_method :===, :matches?

    def matches_between(start, finish)
      start, finish = [start, finish].sort.map(&:to_time)
      start = start.round  # discard fractional seconds
      matches = []
      while start <= finish
        matches << start if self.matches?(start)
        start = top_of_next_minute(start)
      end
      matches
    end

    def to_s
      "\#<#{self.class.name} #{@spec_str.inspect}>"
    end
    alias_method :inspect, :to_s

    private
    def top_of_next_minute(start)
      initial_minute = start.min
      start += 60
      start += 60 if start.min == initial_minute  # In case of leap seconds
      start -= start.sec
    end
  end
end
