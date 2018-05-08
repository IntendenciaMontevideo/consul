class AddShowTextToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :text_show_finished, :string
  end
end
