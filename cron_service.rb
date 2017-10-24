require_relative 'constants/cron'
require_relative 'cron/command'
require_relative 'cron/validator'

class CronService
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def perform
    validate_input
    if @validator.valid?
      parse_input
      dislay_results
    else
      display_errors
    end
  end

  private

  def validate_input
    @validator = Cron::Validator.new(@input)
    @validator.perform
  end

  def display_errors
    @validator.errors.each do |error|
      puts error
    end
  end

  def parse_input
    @commands ||= begin
      result = []
      input.split.each_with_index do |command, type|
        result << Cron::Command.new(command, type)
      end
      result
    end
  end

  def dislay_results
    @commands.each do |command|
      puts "#{command.command_type} - #{command.values.join(' ')}"
    end
  end
end