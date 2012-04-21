namespace :sync do
  desc "Synchronise with open.data.gov"
  task :open_data_gov => :environment do
    Sync::OpenDataController.new.download_data_sources
  end
end