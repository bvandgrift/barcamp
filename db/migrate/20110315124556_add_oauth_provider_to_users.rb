class AddOauthProviderToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :oauth_provider, :string
  end

  def self.down
    remove_column :users, :oauth_provider
  end
end
