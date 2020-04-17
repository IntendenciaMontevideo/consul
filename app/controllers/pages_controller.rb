class PagesController < ApplicationController
  skip_authorization_check

  def show
    @custom_page = SiteCustomization::Page.published.find_by(slug: params[:id])

    if @custom_page.present?
      @related_pages = @custom_page.get_related_pages
      render action: :custom_page
    else
      if params[:id] == 'associate'
        if current_user.blank?
          redirect_to root_path, notice: "Debes iniciar sesión para realizar esta acción."
        elsif current_user.is_level_login_more_one?
          redirect_to root_path
        else
          render action: params[:id]
        end
      else
        render action: params[:id]
      end
    end
  rescue ActionView::MissingTemplate
    head 404
  end

  def index
    @pages = SiteCustomization::Page.unordered_published.order(updated_at: :desc).page(params[:page]).per(5)
  end
end
