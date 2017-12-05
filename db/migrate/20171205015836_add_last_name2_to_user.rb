class AddLastName2ToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_name_2, :string
  end
end
