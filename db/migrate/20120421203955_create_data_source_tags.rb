class CreateDataSourceTags < ActiveRecord::Migration
  def self.up
    create_table :data_source_tags do |t|
      t.integer :data_source_id
      t.string :tag_id
    end
  end

  def self.down
    drop_table :data_source_tags
  end
end