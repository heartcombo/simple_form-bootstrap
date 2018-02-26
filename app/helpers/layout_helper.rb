module LayoutHelper
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def is_active?(link_path, return_class = "active")
    current_page?(link_path) ? return_class : nil
  end

  def markdown(source)
    options = {
      input: 'GFM',
      syntax_highlighter: :rouge,
      syntax_highlighter_opts: {
        css_class: 'highlight p-4 mb-0'
      }
    }
    Kramdown::Document.new(source, options).to_html.html_safe
  end

  def render_source(input, language = :erb)
    markdown "```#{language.to_s}\n#{input}```"
  end
end
