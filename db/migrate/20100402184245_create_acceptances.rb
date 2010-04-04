class CreateAcceptances < ActiveRecord::Migration
  def self.up
    create_table :acceptances do |t|
      t.integer :talk_id, :null => false
      t.integer :room_id, :null => false
      t.integer :barcamp_id, :null => false
      t.integer :period_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :acceptances
  end
end
