class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :slug
      t.string :title
    end
  end

  def self.down
    drop_table :tags
  end
end
