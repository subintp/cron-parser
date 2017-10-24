require_relative 'cron_service'

v = CronService.new(ARGV[0].chomp)
v.perform