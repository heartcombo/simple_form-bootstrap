class BS3CollectionCheckBoxesInput < SimpleForm::Inputs::CollectionCheckBoxesInput
  def build_nested_boolean_style_item_tag(collection_builder)
    out = collection_builder.check_box + collection_builder.text
    out.gsub!(/form-control/, '')
    out.html_safe
  end
end
