require 'test_helper'

class FieldsWithErrorsTest < ActionView::TestCase
  setup do
    @user = User.new
    @user.errors.add(:email, :invalid)

    @builder = SimpleForm::FormBuilder.new(:user, @user, self, wrapper: :vertical_form, wrapper_mappings: {})

    @original_proc = ActionView::Base.field_error_proc
    ActionView::Base.field_error_proc = proc { |input, _instance| input }
  end

  teardown do
    ActionView::Base.field_error_proc = @original_proc
  end

  def test_required_email_field_with_error
    actual = @builder.input(:email)
    expected = <<-HTML
      <div class="mb-3 email required user_email">
        <label class="form-label email required" for="user_email">Email <abbr title="required">*</abbr></label>
        <input aria-invalid="true" class="form-control is-invalid string email required" id="user_email" name="user[email]" placeholder="Enter email" type="email"/>
        <div class="invalid-feedback">Email is invalid</div>
        <div class="form-text">We'll never share your email with anyone else.</div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end
end
