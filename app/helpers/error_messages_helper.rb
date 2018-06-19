# encoding: utf-8
# Nifty Generators - https://github.com/ryanb/nifty-generators
#
# copy from Nifty Generators,
# markup optimized for bootstrap
#
# Usage:
#    <%= f.error_messages %>
#    <%= error_messages_for(@object) %>
#
# Markup aliged with bootstrap v4
module ErrorMessagesHelper
  # Render error messages for the given objects. The :message and :header_message options are allowed.
  def error_messages_for(*objects)
    options = objects.extract_options!
    options[:template_header] ||= I18n.t("errors.template.header", count: objects[0].errors.size, model: objects[0].class.model_name.human)
    options[:template_body] ||= I18n.t("errors.template.body")
    messages = objects.compact.flat_map { |o| o.errors.full_messages }
    unless messages.empty?
      content_tag(:div, class: "alert alert-danger alert-form alert-dismissible") do
        content_tag(:div, class: "media") do
          icon_svg("alerts/error.svg", class: "d-flex mr-3 icon icon-3x") +
          content_tag(:div, class: "media-body") do
            list_items = messages.map { |msg| content_tag(:li, msg) }
            content_tag(:a, "×", href: "#", class: "close", data: { dismiss: "alert" }) +
            content_tag(:h6, options[:template_header], class: "text-uppercase text-reset my-1") +
            content_tag(:p, options[:template_body]) +
            content_tag(:ul, list_items.join.html_safe, class: "mb-0")
          end
        end
      end
    end
  end

  module FormBuilderAdditions
    def error_messages(options = {})
      @template.error_messages_for(@object, options)
    end
  end
end

ActionView::Helpers::FormBuilder.send(:include, ErrorMessagesHelper::FormBuilderAdditions)
