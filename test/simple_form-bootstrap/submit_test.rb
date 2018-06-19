require 'test_helper'

class SubmitTest < ActionView::TestCase
  setup do
    @user    = User.new
    @builder = SimpleForm::FormBuilder.new(:user, @user, self, wrapper: :vertical_form, wrapper_mappings: {})
  end

  def test_submit
    expected = <<-HTML
      <input data-disable-with="Create User!" name="commit" type="submit" value="Create User!"/>
    HTML
    assert_xml_equal expected, @builder.submit
  end

  def test_submit_with_label
    expected = <<-HTML
      <input data-disable-with="Save" name="commit" type="submit" value="Save"/>
    HTML
    assert_xml_equal expected, @builder.submit('Save')
  end

  def test_button_submit
    expected = <<-HTML
      <input class="btn" data-disable-with="Create User!" name="commit" type="submit" value="Create User!"/>
    HTML
    assert_xml_equal expected, @builder.button(:submit)
  end

  def test_button_submit_with_label
    expected = <<-HTML
      <input class="btn" data-disable-with="Save" name="commit" type="submit" value="Save"/>
    HTML
    assert_xml_equal expected, @builder.button(:submit, 'Save')
  end

  def test_button_button_submit_primary
    expected = <<-HTML
      <input class="btn btn-primary" data-disable-with="Create User!" name="commit" type="submit" value="Create User!"/>
    HTML
    assert_xml_equal expected, @builder.button(:submit, class: "btn-primary")
  end
end
