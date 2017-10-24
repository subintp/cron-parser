require_relative '../cron_service'

describe CronService do

  it "should process valid cron command" do
    valid_cron_input = "*/15 0 1,15 * 1-5 /usr/bin/find"
    validator = CronService.new(valid_cron_input)

    expect(validator).to receive(:parse_input)
    expect(validator).to receive(:dislay_results)

    validator.perform
  end

  it "should display errors for  invalid cron command" do
    invalid_cron_input = "*/15 0 1||15 * 1-5 /usr/bin/find"
    validator = CronService.new(invalid_cron_input)

    expect(validator).to receive(:display_errors)

    validator.perform
  end
end