class AddAccessLevelToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :access_level, :integer, default: 2
  end
end
