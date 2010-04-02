class CreateBarcamps < ActiveRecord::Migration
  def self.up
    create_table :barcamps do |t|
      t.string :title
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.string :url
      t.boolean :active, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :barcamps
  end
end
