class AddLinksuccessToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :link_success, :string
  end
end
