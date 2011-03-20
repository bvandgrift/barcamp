class RemovePasswordSaltMyHowYouHaveChangedDevise < ActiveRecord::Migration
  def self.up
    remove_column :users, :password_salt
  end

  def self.down
    # unreversable
  end
end
