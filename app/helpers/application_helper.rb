module ApplicationHelper
  def render_code(file_path)
    File.read(file_path)
  end
end
