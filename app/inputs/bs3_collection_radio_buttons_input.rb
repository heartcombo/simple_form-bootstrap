class BS3CollectionRadioButtonsInput < SimpleForm::Inputs::CollectionRadioButtonsInput
  def apply_nested_boolean_collection_options!(options)
    options[:item_wrapper_tag] = :div
  end

  def build_nested_boolean_style_item_tag(collection_builder)
    out = collection_builder.radio_button + collection_builder.text
    out = "<label>#{out}</label>"
    out.gsub!(/form-control/, '')
    out.html_safe
  end
end
