class DataSourceCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :data_source
end