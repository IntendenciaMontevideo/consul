class AddPollGroupToPoll < ActiveRecord::Migration
  def change
    add_reference :polls, :poll_group, index: true
  end
end
