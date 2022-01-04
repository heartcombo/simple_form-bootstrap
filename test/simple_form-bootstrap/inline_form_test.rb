require 'test_helper'

class InlineFormTest < ActionView::TestCase
  setup do
    @user    = User.new
    wrapper_mappings = {
      boolean: :inline_boolean
    }
    @builder = SimpleForm::FormBuilder.new(:user, @user, self, wrapper: :inline_form, wrapper_mappings: wrapper_mappings)
  end

  def test_required_email_field
    actual = @builder.input(:email)
    expected = <<-HTML
      <div class="col-12 email required user_email">
        <label class="visually-hidden email required" for="user_email">Email <abbr title="required">*</abbr></label>
        <input class="form-control string email required" id="user_email" name="user[email]" placeholder="Enter email" type="email"/>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_input_field
    actual = @builder.input_field(:email, class: "form-control")
    expected = <<-HTML
      <input class="string email required form-control" id="user_email" name="user[email]" placeholder="Enter email" type="email"/>
    HTML
    assert_xml_equal expected, actual
  end

  def test_boolean_as_check_box
    actual = @builder.input(:terms)
    expected = <<-HTML
      <div class="col-12 boolean optional user_terms">
        <div class="form-check">
          <input autocomplete="off" name="user[terms]" type="hidden" value="0"/>
          <input class="form-check-input boolean optional" id="user_terms" name="user[terms]" type="checkbox" value="1"/>
          <label class="form-check-label boolean optional" for="user_terms">Terms</label>
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end
end
