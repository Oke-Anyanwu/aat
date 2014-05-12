module PathsHelper
  def current_active_page_css_class(path)
    'active' if current_page?(path)
  end
end
