class CreateDataSourceCurators < ActiveRecord::Migration
  def self.up
    create_table :data_source_curators do |t|
      t.integer :data_source_id
      t.string :curator_id
    end
  end

  def self.down
    drop_table :data_source_curators
  end
end