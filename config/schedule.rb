# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "~/cron_log.log"

env :GEM_HOME, ENV['GEM_HOME']
env :RAILS_ENV, ENV['RAILS_ENV']
env :SECRET_KEY_BASE, ENV['SECRET_KEY_BASE']

every 24.hours, :at => '07:00am' do
  rake 'notification:normal'
end
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
