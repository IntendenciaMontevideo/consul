# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
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

#every 1.minute do
#  command "date > ~/cron-test.txt"
#end

#every 1.day, at: '5:00 am' do
#  rake "-s sitemap:refresh"
#end

#run whenever
#whenever --update-crontab

# Begin Whenever generated tasks for: /Users/gaston/workspace/consul/config/schedule.rb at: 2019-06-14 15:01:58 -0300
#0 1,2,3,4,5,6 * * * /bin/bash -l -c 'cd /Users/gaston/workspace/consul && bundle exec bin/rails runner -e production '\''Newsletter.send_newsletter'\'''

#10 15 * * * /bin/bash -l -c 'cd /Users/gaston/workspace/consul && bundle exec bin/rails runner -e development '\''Newsletter.send_newsletter'\'''

# End Whenever generated tasks for: /Users/gaston/workspace/consul/config/schedule.rb at: 2019-06-14 15:01:58 -0300
every 1.day, at: ['01:00 am', '02:00 am', '03:00 am', '04:00 am', '05:00 am', '06:00 am', '03:10 pm']  do
  runner "Newsletter.send_newsletter"
end
