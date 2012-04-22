namespace :sync do
  desc "Synchronise with data.nasa.gov"
  task :data_nasa_gov => :environment do
    Sync::DataNasaController.new.download_data_sources
  end
end