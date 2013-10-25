class BS3BooleanInput < SimpleForm::Inputs::BooleanInput
  def label
    out = <<-EOS
      <label class="control-label col-lg-2"></label>
    EOS
    out.html_safe
  end

  def input
    out = <<-EOS
      <div class="checkbox">
        #{build_hidden_field_for_checkbox}
        <label>
          #{build_check_box_without_hidden_field}
          #{label_text}
        </label>
      </div>
    EOS
    out.gsub!(/form-control/, '')
    out.html_safe
  end
end
