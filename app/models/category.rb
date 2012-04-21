class Category < ActiveRecord::Base
  has_many :data_source_categories
  has_many :data_sources, :through => :data_source_categories
end
