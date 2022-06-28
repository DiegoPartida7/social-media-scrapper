require File.expand_path('../config/boot',        __FILE__)
require File.expand_path('../config/environment', __FILE__)
require 'clockwork'
require 'active_support/time' # Allow numeric durations (eg: 1.minutes)

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  # every(1.minutes, 'ScheduledTasks::InstagramJob') do
  #   ScheduledTasks::InstagramJob.perform_async
  # end
  # every(1.day, 'ScheduledTasks::InstagramJob', at: '8:00', tz: 'America/Monterrey') do

  every(1.minutes, 'ScheduledTasks::InstagramJob') do
    ScheduledTasks::InstagramJob.delay.perform
    Delayed::Worker.logger.info("Log Entry")

  end
  # every(1.day, 'ScheduledTasks::InstagramJob', at: '8:00', tz: 'America/Monterrey')

end
