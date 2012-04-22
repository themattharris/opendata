class DataSource < ActiveRecord::Base
  has_many :data_source_tags
  has_many :tags, :through => :data_source_tags
  has_many :data_source_categories
  has_many :categories, :through => :data_source_categories

  class << self
    def tagged_with(tags)
      data_sources = []
      Tag.find_all_by_slug(tags).each do |t|
        data_sources+=t.data_sources
      end
      data_sources
    end

    def in_category(category)
      data_sources = []
      Category.find_all_by_slug(category).each do |t|
        data_sources+=t.data_sources
      end
      data_sources
    end
  end

end