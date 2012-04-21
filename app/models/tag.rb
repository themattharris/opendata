class Tag < ActiveRecord::Base
  has_many :data_source_tags
  has_many :data_sources, :through => :data_source_tags
end
