class Category < ActiveRecord::Base
  validates_presence_of :slug
  validates_uniqueness_of :slug

  has_many :data_source_categories
  has_many :data_sources, :through => :data_source_categories

  def to_s
    title
  end
end
