require_relative '../constants/cron'
require_relative 'parser'


module Cron
  class Command
    attr_reader :input, :type

    def initialize(input, type)
      @input = input
      @type = type
    end

    def range_by_division?
      input.include?('/')
    end

    def range_by_range?
      input.include?('-')
    end

    def range_by_values?
      input.include?(',')
    end

    def complete_range?
      input == '*'
    end

    def command_type
      COMMAND_TYPES[type]
    end

    def max_value
      RANGE_BY_POSITION[type].max.to_i
    end

    def min_value
      RANGE_BY_POSITION[type].min.to_i
    end

    def values 
      @values ||= begin
        if command_type != 'command'
          parser = Cron::Parser.new self
          parser.parse
          parser.values
        else
          [input]
        end
      end
    end

  end
end