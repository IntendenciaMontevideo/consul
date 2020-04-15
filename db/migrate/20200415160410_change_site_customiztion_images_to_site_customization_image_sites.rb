class ChangeSiteCustomiztionImagesToSiteCustomizationImageSites < ActiveRecord::Migration
  def change
    rename_table :site_customization_images, :site_customization_image_sites
  end
end
