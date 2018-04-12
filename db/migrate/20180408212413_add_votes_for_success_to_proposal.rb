class AddVotesForSuccessToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :votes_for_success, :integer, default: 500
    add_column :proposals, :state, :integer, default: Proposal::STATES[:open]
  end
end
