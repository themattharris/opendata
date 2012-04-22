# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def random_label_variant
    [nil, 'label-success', 'label-warning', 'label-important', 'label-info', 'label-inverse'].sort_by{rand}[0]
  end

end