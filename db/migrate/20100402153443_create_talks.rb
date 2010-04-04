class CreateTalks < ActiveRecord::Migration
  def self.up
    create_table :talks do |t|
      t.string :title
      t.string :speaker_name, :null => false
      t.string  :hashtag
      t.integer :barcamp_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :talks
  end
end
