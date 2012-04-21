class CreateDataSourceCategories < ActiveRecord::Migration
  def self.up
    create_table :data_source_categories do |t|
      t.integer :data_source_id
      t.integer :category_id
    end
  end

  def self.down
    drop_table :data_source_categories
  end
end