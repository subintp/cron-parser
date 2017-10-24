require_relative '../../constants/cron'
require_relative '../../cron/input_validator'

describe Cron::InputValidator do

  describe "Valid Inputs" do 

    it "Valid minute" do
      command_string = "*/30"
      command_type = COMMAND_VALUES['minute']
    	validator = Cron::InputValidator.new(command_string, command_type)
    	validator.perform

    	expect(validator.valid?).to eql(true)
    end


    it "Valid hour" do
      command_string = "*/10"
      command_type = COMMAND_VALUES['hour']
      validator = Cron::InputValidator.new(command_string, command_type)
      validator.perform

      expect(validator.valid?).to eql(true)
    end


    it "Valid month" do
      command_string = "*/5"
      command_type = COMMAND_VALUES['month']
      validator = Cron::InputValidator.new(command_string, command_type)
      validator.perform

      expect(validator.valid?).to eql(true)
    end


    it "Valid day of month" do
      command_string = "*/2"
      command_type = COMMAND_VALUES['day of month']
      validator = Cron::InputValidator.new(command_string, command_type)
      validator.perform

      expect(validator.valid?).to eql(true)
    end

    it "Valid day of week" do
      command_string = "*/3"
      command_type = COMMAND_VALUES['day of week']
      validator = Cron::InputValidator.new(command_string, command_type)
      validator.perform

      expect(validator.valid?).to eql(true)
    end
  end

  describe "Invalid Inputs" do

    it "Invalid minute" do
      command_string = "*/90"
      command_type = COMMAND_VALUES['minute']
      validator = Cron::InputValidator.new(command_string, command_type)
      validator.perform

      expect(validator.valid?).to eql(false)
    end


    it "Invalid hour" do
      command_string = "*/40"
      command_type = COMMAND_VALUES['hour']
      validator = Cron::InputValidator.new(command_string, command_type)
      validator.perform

      expect(validator.valid?).to eql(false)
    end


    it "Invalid month" do
      command_string = "*/50"
      command_type = COMMAND_VALUES['month']
      validator = Cron::InputValidator.new(command_string, command_type)
      validator.perform

      expect(validator.valid?).to eql(false)
    end


    it "Invalid day of month" do
      command_string = "*/40"
      command_type = COMMAND_VALUES['day of month']
      validator = Cron::InputValidator.new(command_string, command_type)
      validator.perform

      expect(validator.valid?).to eql(false)
    end

    it "Invalid day of week" do
      command_string = "*/30"
      command_type = COMMAND_VALUES['day of week']
      validator = Cron::InputValidator.new(command_string, command_type)
      validator.perform

      expect(validator.valid?).to eql(false)
    end
  end
end