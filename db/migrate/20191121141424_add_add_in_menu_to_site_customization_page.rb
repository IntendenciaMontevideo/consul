class AddAddInMenuToSiteCustomizationPage < ActiveRecord::Migration
  def change
    add_column :site_customization_pages, :add_in_menu, :boolean, default: false
  end
end
