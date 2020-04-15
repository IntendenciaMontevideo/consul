class Admin::SiteCustomization::ImageSitesController < Admin::SiteCustomization::BaseController
  load_and_authorize_resource :image_site, class: "SiteCustomization::ImageSite"

  def index
    @images = SiteCustomization::ImageSite.all_images
  end

  def update
    if params[:site_customization_image_site].nil?
      redirect_to admin_site_customization_image_sites_path
      return
    end

    if @image_site.update(image_params)
      notice = t('admin.site_customization.images.update.notice')
      redirect_to admin_site_customization_image_sites_path, notice: notice
    else
      flash.now[:error] = t('admin.site_customization.images.update.error')

      @images = SiteCustomization::ImageSite.all_images
      idx = @images.index {|e| e.name == @image_site.name }
      @images[idx] = @image_site

      render :index
    end
  end

  def destroy
    @image_site.image = nil
    if @image_site.save
      notice = t('admin.site_customization.images.destroy.notice')
      redirect_to admin_site_customization_image_sites_path, notice: notice
    else
      notice = t('admin.site_customization.images.destroy.error')
      redirect_to admin_site_customization_image_sites_path, notice: notice
    end
  end

  private

    def image_params
      params.require(:site_customization_image_site).permit(
        :image
      )
    end
end
