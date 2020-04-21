class AddOrderNumberToWizardCards < ActiveRecord::Migration
  def change
    add_column :widget_cards, :order_number, :integer
  end
end
