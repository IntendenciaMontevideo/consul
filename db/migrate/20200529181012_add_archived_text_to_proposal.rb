class AddArchivedTextToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :text_show_archived, :string
  end
end
