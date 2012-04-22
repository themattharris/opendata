class Curator < ActiveRecord::Base
  validates_presence_of :center

  has_many :data_source_curators
  has_many :data_sources, :through => :data_source_curators

  def to_s
    if org.nil?
      "#{center}"
    else
      "#{center}: #{org}"
    end
  end
end