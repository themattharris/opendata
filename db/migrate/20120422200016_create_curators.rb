class CreateCurators < ActiveRecord::Migration
  def self.up
    create_table :curators do |t|
      t.string :person_name
      t.string :person_email
      t.string :url
      t.string :org
      t.string :center

      t.timestamps
    end
  end

  def self.down
    drop_table :curators
  end
end
