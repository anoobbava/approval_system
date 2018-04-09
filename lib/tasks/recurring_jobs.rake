# Awesome Jobs
namespace :recurring do
  task init: :environment do
    Delayed::Job.where('(handler LIKE ?)', '--- !ruby/object:Recurring::%').destroy_all
    DailyMail.schedule!
  end
end
