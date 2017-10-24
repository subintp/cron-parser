require_relative '../../constants/cron'
require_relative '../../cron/validator'

describe Cron::Parser do

  describe "Minute" do

    it "should return correct values for complete range" do
      command_string = "*"
      command_type = COMMAND_VALUES['minute']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse

      expect(parser.values.count).to eql(MINUTES_RANGE.count)

    end


    it "should return correct values for range by division"  do
      command_string = "*/15"
      command_type = COMMAND_VALUES['minute']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse


      expect(parser.values.count).to eql(4)
    end


    it "should return correct values for range by range" do
      command_string = "1-15"
      command_type = COMMAND_VALUES['minute']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse


      expect(parser.values.count).to eql(15)
    end


    it "should return correct values for range by values"  do
      command_string = "1,2,3"
      command_type = COMMAND_VALUES['minute']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse

      expect(parser.values.count).to eql(3)
    end

  end


  describe "Hour" do

    it "should return correct values for complete range" do
      command_string = "*"
      command_type = COMMAND_VALUES['hour']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse

      expect(parser.values.count).to eql(HOURS_RANGE.count)

    end


    it "should return correct values for range by division"  do
      command_string = "*/15"
      command_type = COMMAND_VALUES['hour']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse


      expect(parser.values.count).to eql(2)
    end


    it "should return correct values for range by range" do
      command_string = "1-3"
      command_type = COMMAND_VALUES['hour']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse


      expect(parser.values.count).to eql(3)
    end


    it "should return correct values for range by values"  do
      command_string = "1,2,3"
      command_type = COMMAND_VALUES['hour']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse

      expect(parser.values.count).to eql(3)
    end

  end

  describe "Month" do

    it "should return correct values for complete range" do
      command_string = "*"
      command_type = COMMAND_VALUES['month']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse

      expect(parser.values.count).to eql(MONTHS_RANGE.count)

    end


    it "should return correct values for range by division"  do
      command_string = "*/3"
      command_type = COMMAND_VALUES['month']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse


      expect(parser.values.count).to eql(4)
    end


    it "should return correct values for range by range" do
      command_string = "1-3"
      command_type = COMMAND_VALUES['month']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse


      expect(parser.values.count).to eql(3)
    end


    it "should return correct values for range by values"  do
      command_string = "1,2,3"
      command_type = COMMAND_VALUES['month']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse

      expect(parser.values.count).to eql(3)
    end

  end


  describe "Day of month" do

    it "should return correct values for complete range" do
      command_string = "*"
      command_type = COMMAND_VALUES['day of month']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse

      expect(parser.values.count).to eql(DAYS_OF_MONTH_RANGE.count)

    end


    it "should return correct values for range by division"  do
      command_string = "*/3"
      command_type = COMMAND_VALUES['day of month']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse


      expect(parser.values.count).to eql(10)
    end


    it "should return correct values for range by range" do
      command_string = "1-3"
      command_type = COMMAND_VALUES['day of month']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse


      expect(parser.values.count).to eql(3)
    end


    it "should return correct values for range by values"  do
      command_string = "1,2,3"
      command_type = COMMAND_VALUES['day of month']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse

      expect(parser.values.count).to eql(3)
    end

  end

  describe "Day of week" do

    it "should return correct values for complete range" do
      command_string = "*"
      command_type = COMMAND_VALUES['day of week']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse

      expect(parser.values.count).to eql(DAYS_OF_WEEK_RANGE.count)

    end


    it "should return correct values for range by division"  do
      command_string = "*/3"
      command_type = COMMAND_VALUES['day of week']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse


      expect(parser.values.count).to eql(2)
    end


    it "should return correct values for range by range" do
      command_string = "1-3"
      command_type = COMMAND_VALUES['day of week']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse


      expect(parser.values.count).to eql(3)
    end


    it "should return correct values for range by values"  do
      command_string = "1,2,3"
      command_type = COMMAND_VALUES['day of week']
      command = Cron::Command.new(command_string, command_type)

      parser = Cron::Parser.new(command)
      parser.parse

      expect(parser.values.count).to eql(3)
    end

  end


end