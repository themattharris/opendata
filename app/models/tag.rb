class Tag < ActiveRecord::Base
  validates_presence_of :slug
  validates_uniqueness_of :slug

  has_many :data_source_tags
  has_many :data_sources, :through => :data_source_tags
end
