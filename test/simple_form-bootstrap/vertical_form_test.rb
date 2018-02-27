require 'test_helper'

class VerticalFormTest < ActionView::TestCase
  setup do
    @user    = User.new
    @builder = SimpleForm::FormBuilder.new(:user, @user, self, wrapper: :vertical_form, wrapper_mappings: {})
  end

  def test_required_email_field
    actual = @builder.input(:email)
    expected = <<-HTML
      <div class="form-group email required user_email">
        <label class="form-control-label email required" for="user_email">Email <abbr title="required">*</abbr></label>
        <input class="form-control string email required" id="user_email" name="user[email]" placeholder="Enter email" type="email"/>
        <small class="form-text text-muted">We'll never share your email with anyone else.</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end
end
