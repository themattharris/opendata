class DataSourceCurator < ActiveRecord::Base
  belongs_to :curator
  belongs_to :data_source
end