require 'test_helper'

class HorizontalFormTest < ActionView::TestCase

  setup do
    @user    = User.new
    @builder = SimpleForm::FormBuilder.new(:user, @user, self, wrapper: :horizontal_form, wrapper_mappings: {})
  end

  def test_required_email_field
    actual = @builder.input(:email)
    expected = <<-HTML
      <div class="form-group row email required user_email">
        <label class="col-sm-3 col-form-label email required" for="user_email">Email <abbr title="required">*</abbr></label>
        <div class="col-sm-9">
          <input class="form-control string email required" id="user_email" name="user[email]" placeholder="Enter email" type="email"/>
          <small class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end
end
