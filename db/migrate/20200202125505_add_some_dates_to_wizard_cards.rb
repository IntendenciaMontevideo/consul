class AddSomeDatesToWizardCards < ActiveRecord::Migration
  def change
    add_column :widget_cards, :init_datetime, :datetime
    add_column :widget_cards, :end_datetime, :datetime
  end
end
