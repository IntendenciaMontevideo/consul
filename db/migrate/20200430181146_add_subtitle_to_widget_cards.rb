class AddSubtitleToWidgetCards < ActiveRecord::Migration
  def change
    add_column :widget_cards, :subtitle, :string
  end
end
