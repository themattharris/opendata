class Appointment < ActiveRecord::Base
  belongs_to :tag
  belongs_to :data_source
end