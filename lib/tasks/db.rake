namespace :db do
  desc "Drop and recreate local db"
  task :rebuild => :environment do
    envs = ['development', 'test']
    envs.each do |env|
      puts "Rebuilding #{env}"
      system("env RAILS_ENV=#{env} rake db:drop db:create db:migrate")
    end
    puts "done."
  end

  desc "Drop, recreate and then load fixtures into the local db"
  task :rebuild_with_fixtures => [:rebuild, :environment] do
    envs = ['development', 'test']
    envs.each do |env|
      system("env RAILS_ENV=#{env} rake db:fixtures:load")
    end
    puts "done."
  end

  desc 'Create YAML test fixtures from data in an existing database.
  Defaults to development database. Set RAILS_ENV to override.'

  task :extract_fixtures => :environment do
    sql = "SELECT * FROM %s"
    skip_tables = ["schema_info", "sessions", "schema_migrations"]
    ActiveRecord::Base.establish_connection
    tables = ENV['FIXTURES'] ? ENV['FIXTURES'].split(/,/) : ActiveRecord::Base.connection.tables - skip_tables
    tables.each do |table_name|
      i = "000"
      File.open("#{RAILS_ROOT}/test/fixtures/#{table_name}.yml", 'w') do |file|
        data = ActiveRecord::Base.connection.select_all(sql % table_name)
        file.write data.inject({}) { |hash, record|
          hash["#{table_name}_#{i.succ!}"] = record
          hash
        }.to_yaml
      end
    end
  end
end