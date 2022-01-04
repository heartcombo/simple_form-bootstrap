require 'test_helper'

class CustomFieldsTest < ActionView::TestCase
  setup do
    @user    = User.new
    @builder = SimpleForm::FormBuilder.new(:user, @user, self, wrapper: :vertical_form, wrapper_mappings: {})
  end

  def test_boolean_as_switch
    actual = @builder.input(:terms, wrapper: :custom_boolean_switch)
    expected = <<-HTML
      <div class="mb-3 boolean optional user_terms">
        <div class="form-check form-switch">
          <input autocomplete="off" name="user[terms]" type="hidden" value="0"/>
          <input class="form-check-input boolean optional" id="user_terms" name="user[terms]" type="checkbox" value="1"/>
          <label class="form-check-label boolean optional" for="user_terms">Terms</label>
          <div class="form-text">Boolean as check box example</div>
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end
end
