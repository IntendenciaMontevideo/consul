module PagesHelper

  def format_categories(array_form = false)
    if array_form
      SiteCustomization::Page.get_categories
    else
      SiteCustomization::Page.get_categories.join(', ')
    end
  end

end
