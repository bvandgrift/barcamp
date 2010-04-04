class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.integer :barcamp_id, :null => false
      t.string :name, :null => false
      t.datetime :start_time, :null => false
      t.datetime :end_time, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
