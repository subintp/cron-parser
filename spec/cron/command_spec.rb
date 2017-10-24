require_relative '../../cron/command'
require_relative '../../constants/cron'

describe Cron::Command do

  describe "Time range" do 

    it "should set proper values for complete range" do
      command_string = "*"
      command_type = COMMAND_VALUES['minute']
      command = Cron::Command.new(command_string, command_type)

      expect(command.range_by_division?).to eql(false)
      expect(command.range_by_range?).to eql(false)
      expect(command.range_by_values?).to eql(false)
      expect(command.complete_range?).to eql(true)

      expect(command.max_value).to eql(59)
      expect(command.min_value).to eql(0)

      expect(command.values.count).to eql(MINUTES_RANGE.count)
    end

    it "should set proper values for range by division" do
      command_string = "*/15"
      command_type = COMMAND_VALUES['hour']
      command = Cron::Command.new(command_string, command_type)

      expect(command.range_by_division?).to eql(true)
      expect(command.range_by_range?).to eql(false)
      expect(command.range_by_values?).to eql(false)
      expect(command.complete_range?).to eql(false)


      expect(command.max_value).to eql(23)
      expect(command.min_value).to eql(0)

      expect(command.values.count).to eql(2)
    end


    it "should set proper values for range by range" do
      command_string = "0-15"
      command_type = COMMAND_VALUES['minute']
      command = Cron::Command.new(command_string, command_type)

      expect(command.range_by_division?).to eql(false)
      expect(command.range_by_range?).to eql(true)
      expect(command.range_by_values?).to eql(false)
      expect(command.complete_range?).to eql(false)

      expect(command.max_value).to eql(59)
      expect(command.min_value).to eql(0)

      expect(command.values.count).to eql(16)
    end


    it "should set proper values for range by values" do
      command_string = "1,10"
      command_type = COMMAND_VALUES['month']
      command = Cron::Command.new(command_string, command_type)

      expect(command.range_by_division?).to eql(false)
      expect(command.range_by_range?).to eql(false)
      expect(command.range_by_values?).to eql(true)
      expect(command.complete_range?).to eql(false)

      expect(command.max_value).to eql(12)
      expect(command.min_value).to eql(1)
      
      expect(command.values.count).to eql(2)
    end
  end

  describe "Time type " do

    it "should set proper values for minute" do
      command_string = "*"
      command_type = COMMAND_VALUES['minute']
      command = Cron::Command.new(command_string, command_type)

      expect(command.max_value).to eql(59)
      expect(command.min_value).to eql(0)

      expect(command.values.count).to eql(MINUTES_RANGE.count)
    end


    it "should set proper values for hour" do
      command_string = "*"
      command_type = COMMAND_VALUES['hour']
      command = Cron::Command.new(command_string, command_type)

      expect(command.max_value).to eql(23)
      expect(command.min_value).to eql(0)

      expect(command.values.count).to eql(HOURS_RANGE.count)
    end

    it "should set proper values for month" do
      command_string = "*"
      command_type = COMMAND_VALUES['month']
      command = Cron::Command.new(command_string, command_type)

      expect(command.max_value).to eql(12)
      expect(command.min_value).to eql(1)

      expect(command.values.count).to eql(MONTHS_RANGE.count)
    end


    it "should set proper values for days of month" do
      command_string = "*"
      command_type = COMMAND_VALUES['day of month']
      command = Cron::Command.new(command_string, command_type)

      expect(command.max_value).to eql(31)
      expect(command.min_value).to eql(1)

      expect(command.values.count).to eql(DAYS_OF_MONTH_RANGE.count)
    end

    it "should set proper values for days of week" do
      command_string = "*"
      command_type = COMMAND_VALUES['day of week']
      command = Cron::Command.new(command_string, command_type)

      expect(command.max_value).to eql(6)
      expect(command.min_value).to eql(0)

      expect(command.values.count).to eql(DAYS_OF_WEEK_RANGE.count)
    end

    it "should set proper values for command" do
      command_string = "/usr/bin/parse"
      command_type = COMMAND_VALUES['command']
      command = Cron::Command.new(command_string, command_type)
      expect(command.values.count).to eql(1)
    end
  end
end