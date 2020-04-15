class AddCategoriesToSiteCustomizationPages < ActiveRecord::Migration
  def change
    add_column :site_customization_pages, :categories, :string
  end
end
