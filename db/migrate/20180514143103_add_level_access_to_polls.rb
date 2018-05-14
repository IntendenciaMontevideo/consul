class AddLevelAccessToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :level_access, :integer
  end
end
