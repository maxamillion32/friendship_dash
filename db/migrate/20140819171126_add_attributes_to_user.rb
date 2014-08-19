class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :username, :string
    add_column :users, :pin, :string
  end
end
