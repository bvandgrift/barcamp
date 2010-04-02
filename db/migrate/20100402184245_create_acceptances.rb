class CreateAcceptances < ActiveRecord::Migration
  def self.up
    create_table :acceptances do |t|
      t.integer :talk_id
      t.integer :room_id
      t.integer :barcamp_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :acceptances
  end
end
