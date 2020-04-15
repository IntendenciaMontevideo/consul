class AddColumnsToSiteCustomizationPages < ActiveRecord::Migration
  def change
    add_column :site_customization_pages, :related_pages_count, :integer
    add_column :site_customization_pages, :summary, :text
  end
end
