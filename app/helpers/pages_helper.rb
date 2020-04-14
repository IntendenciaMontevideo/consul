module PagesHelper

  def format_categories
    SiteCustomization::Page.get_categories
  end

end