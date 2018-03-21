class AddLevelLoginToUser < ActiveRecord::Migration
  def change
    add_column :users, :level_login, :integer
  end
end
