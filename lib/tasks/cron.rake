desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  %w(Plan Spot User).each do |target|
    puts "Updating #{target} Ranking..."
    Ranking.update(target, 7.days)
    puts "done."
  end
end
