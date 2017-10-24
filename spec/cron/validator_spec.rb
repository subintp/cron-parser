require_relative '../../constants/cron'
require_relative '../../cron/validator'

describe Cron::Validator do

  it "should return valid for correct no of cron parameters" do
    cron_input = "*/15 0 1,15 * 1-5 /usr/bin/find"
    validator = Cron::Validator.new(cron_input)
    validator.perform

    expect(validator.valid?).to eql(true)
  end


  it "should return valid for correct cron syntax"  do
    cron_input = "*/15 0 1,15 * 1-5 /usr/bin/find"
    validator = Cron::Validator.new(cron_input)
    validator.perform

    expect(validator.valid?).to eql(true)
  end


  it "should return invalid for incorrect no of cron parameters" do
    cron_input = "*/15 0 1,15 * 1-5"
    validator = Cron::Validator.new(cron_input)
    validator.perform

    expect(validator.valid?).to eql(false)
  end


  it "should return valid for incorrect cron syntax"  do
    cron_input = "*/15 0 1||15 * 1-5 /usr/bin/find"
    validator = Cron::Validator.new(cron_input)
    validator.perform

    expect(validator.valid?).to eql(false)
  end
end