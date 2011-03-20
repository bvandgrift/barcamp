class LengthenPasswordEncryption < ActiveRecord::Migration
  def self.up
    change_column :users, :encrypted_password, :string, :limit => 255
  end

  def self.down
    change_column :users, :encrypted_password, :string, :limit => 40
  end
end
