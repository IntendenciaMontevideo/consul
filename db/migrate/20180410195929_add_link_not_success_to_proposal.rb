class AddLinkNotSuccessToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :link_not_success, :string
  end
end
