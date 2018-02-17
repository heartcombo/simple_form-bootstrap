module LayoutHelper
  def is_active?(link_path, return_class = "active")
    current_page?(link_path) ? return_class : nil
  end
end
