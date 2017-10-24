require_relative '../constants/cron'
require_relative 'command'


module Cron

  class InputValidator

    attr_reader :command, :type
    attr_accessor :errors, :valid

    def initialize(input, type)
      @command = Cron::Command.new(input, type)
      @type = type
      @errors = []
      @valid = true
    end

    def perform
      validate_input
    end

    def valid?
      valid == true
    end

    private

    def mark_as_invalid
      @valid = false
    end

    def validate_input
      if command.range_by_division?
        validate_range_by_divison
      elsif command.range_by_range?
        validate_range_by_range
      elsif command.range_by_values?
        validate_range_by_values
      elsif command.complete_range?
        return
      else
        validate_constant_range
      end
    end

    def validate_range_by_divison
      divider = command.input.split('/').pop

      if divider.to_i == 0
        errors << "Incorrect value for #{command.command_type}"
        mark_as_invalid
      end

      if divider.to_i > RANGE_BY_POSITION[type].max 
        errors << "Incorrect value for #{command.command_type}"
        mark_as_invalid
      end

    end

    def validate_range_by_range
      ranges = command.input.split('-')
      if ranges.first.to_i < RANGE_BY_POSITION[type].min || ranges.last.to_i >   RANGE_BY_POSITION[type].max
        errors << "Incorrect value for #{command.command_type}"
        mark_as_invalid
      end
    end

    def validate_range_by_values
      ranges =  command.input.split(',').map(&:to_i)
      if ranges.min < RANGE_BY_POSITION[type].min || ranges.max >   RANGE_BY_POSITION[type].max
        errors << "Incorrect value for #{command.command_type}"
        mark_as_invalid
      end
    end

    def validate_constant_range
      unless  RANGE_BY_POSITION[command.type].include?(command.input.to_i)
        errors << "Incorrect value for #{command.command_type}"
        mark_as_invalid
      end
    end

  end
end