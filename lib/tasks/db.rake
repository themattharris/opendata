namespace :db do
  desc "Drop and recreate local db"
  task :rebuild => :environment do
    envs = ['development', 'test']
    envs.each do |env|
      puts "Rebuilding #{env}"
      system("env RAILS_ENV=#{env} rake db:drop db:create db:migrate db:fixtures:load")
    end
  end
  puts "done."
end