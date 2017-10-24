require_relative '../constants/cron'
module Cron
  class Parser

    attr_accessor :values, :command

    def initialize(command)
      @command = command
    end

    def parse
      if command.range_by_division?
        @values = calculate_range_by_division
      elsif command.range_by_range?
        ranges = command.input.split('-')
        @values = *(ranges.first.to_i..ranges.last.to_i)
      elsif command.range_by_values?
        @values = command.input.split(',')
      elsif command.complete_range?
        @values = RANGE_BY_POSITION[command.type]
      elsif command.command_type != 4
        @values = [command.input.to_i]
      else
        @values = [command.input]
      end
    end

    private

    def divider
      @divider ||= command.input.split('/').pop.to_i
    end

    def calculate_range_by_division
      temp = command.min_value
      while temp < command.max_value
        values ||= []
        values << temp
        temp += divider
      end
      values
    end
  end
end