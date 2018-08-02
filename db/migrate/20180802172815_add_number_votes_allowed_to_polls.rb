class AddNumberVotesAllowedToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :number_votes_allowed, :integer, default: 1
  end
end
