module IconHelper
  def icon_svg(path, html_options = {})
    content_tag :i, html_options.merge(class: "#{html_options[:class]} d-inline-block") do
      inline_svg path, class: "d-inline-block", width: "100%", height: "100%", preserve_aspect_ratio: "xMaxYMax meet"
    end
  end
end
