class AddArchivedAtToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :archived_at, :date
  end
end
