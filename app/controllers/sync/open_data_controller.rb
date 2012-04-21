class Sync::OpenDataController < Sync::SyncController

  def download_data_sources
    begin
      logger.progname = 'open_data_gov'
      logger.echo_and_log(:info, 'synchronising with open.data.gov')

      data_sources = OpenDataHelper.fetch_all
      logger.echo_and_log(:info, "received #{data_sources['count']} posts over #{data_sources['pages']} pages.")

      data_sources['posts'].each do |ds|
        new_ds = OpenDataHelper.to_data_source_hash(ds)

        logger.echo_and_log(:info, "processing #{new_ds[:title]}")

        new_ds[:tags] = OpenDataHelper.extract_tags_hash(ds).map do |t|
          Tag.find_or_create_by_slug(t)
        end
        new_ds[:categories] = OpenDataHelper.extract_categories_hash(ds).map do |c|
          Category.find_or_create_by_slug(c)
        end

        d = DataSource.find_or_create_by_remote_id(new_ds)
        d.update_attributes(new_ds)
        if !d.save
          logger.echo_and_log(:warn, "could not save #{d.title}")
        end
      end

      logger.echo_and_log(:info, 'finished synchronising')
    ensure
      logger.close
    end
  end
end
