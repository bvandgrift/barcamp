class AddOauthProviderToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :oauth_provider, :string
    add_column :users, :handle, :string
    add_column :users, :avatar_url, :string
  end

  def self.down
    remove_column :users, :oauth_provider
    remove_column :users, :handle
    remove_column :users, :avatar_url
  end
end
