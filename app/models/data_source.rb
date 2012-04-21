class DataSource < ActiveRecord::Base
  has_many :data_source_tags
  has_many :tags, :through => :data_source_tags
  has_many :data_source_categories
  has_many :categories, :through => :data_source_categories
end