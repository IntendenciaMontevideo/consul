module PagesHelper

  def format_categories(array_form = false)
    if array_form
      SiteCustomization::Page.get_categories
    else
      SiteCustomization::Page.get_categories.join(', ')
    end
  end

  def format_articles_header(category)
    if category.blank?
      'Noticias'
    else
      "Noticias de  #{category}"
    end
  end

end
