class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pid, :string
    add_column :users, :provider, :string
    add_column :users, :token, :string
  end
end
