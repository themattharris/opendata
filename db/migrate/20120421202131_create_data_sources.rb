class CreateDataSources < ActiveRecord::Migration
  def self.up
    create_table :data_sources do |t|
      t.integer :remote_id
      t.integer :parent_id
      t.string :url
      t.string :title
      t.text :content
      t.string :more_info_link
      t.string :acronym
      t.string :datagov_id

      t.timestamps
    end
  end

  def self.down
    drop_table :data_sources
  end
end
