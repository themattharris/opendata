class CreateDataSources < ActiveRecord::Migration
  def self.up
    create_table :data_sources do |t|
      t.integer :remote_id
      t.string :slug
      t.string :url
      t.string :title
      t.text :content
      t.string :more_info_url
      t.string :acronym
      t.string :datagov_id
      t.string :curator_person_name
      t.string :curator_person_email
      t.string :curator_url
      t.string :curator_center
      t.string :curator_org_name

      t.timestamps
    end
  end

  def self.down
    drop_table :data_sources
  end
end
