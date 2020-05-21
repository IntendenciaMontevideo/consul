class AddFeaturedToPollsAndProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :featured, :boolean, default: false
    add_column :polls, :featured, :boolean, default: false
  end
end
