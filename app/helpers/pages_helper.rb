module PagesHelper

  def possibly_active_li(options)
    if current_page?(options)
      '<li class="active">'
    else
      '<li>'
    end
  end
end