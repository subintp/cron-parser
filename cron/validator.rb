require_relative '../constants/cron'
require_relative 'input_validator'

module Cron
  class Validator

    SYNTAX_REGEX = /^(?:[1-9]?\d|\*)(?:(?:[\/-][1-9]?\d)|(?:,[1-9]?\d)+)?$/

    attr_reader :input
    attr_accessor :errors, :valid

    def initialize(input)
      @input = input
      @errors = []
      @valid = true
    end

    def perform
      validate_input_length
      validate_syntax if valid?
      validate_input_values if valid?
    end

    def valid?
      valid == true
    end

    private

    def mark_as_invalid
      @valid = false
    end

    def validate_input_length
      if input.split.length != 6
       errors << "Wrong number of cron commands"
       mark_as_invalid && return
      end
    end

    def validate_syntax
     input.split.slice(0..4).each do |command|
      if !(command =~ SYNTAX_REGEX)
        errors << "Invalid cron syntax" 
        mark_as_invalid && return
      end
     end
    end

    def validate_input_values
      input.split.slice(0..4).each_with_index do |command, index|
        input_validator = Cron::InputValidator.new(command, index)
        input_validator.perform
        unless input_validator.valid?
          mark_as_invalid
          @errors = (@errors + input_validator.errors) unless input_validator.errors.empty?
        end
      end
    end
  end
end