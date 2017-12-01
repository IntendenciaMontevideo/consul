class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :string
    add_column :users, :user_certified, :bool
    add_column :users, :country, :string
    add_column :users, :document, :string
    add_column :users, :user_verified, :bool
    add_column :users, :middle_name, :string
  end
end
