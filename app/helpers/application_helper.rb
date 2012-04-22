# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def has_tags?
    Tag.count > 0
  end

  def has_categories?
    Category.count > 0
  end

  def has_curators?
    true
  end
end
