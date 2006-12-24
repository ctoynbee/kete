class AddVideo < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.column :title, :string, :null => false
      t.column :description, :text
      t.column :filename, :string, :null => false
      t.column :content_type, :string, :null => false
      t.column :size, :integer, :null => false
      t.column :created_at, :datetime, :null => false
      t.column :updated_at, :datetime, :null => false
    end
  end

  def self.down
    drop_table :videos
  end
end
