require 'test_helper'

class FloatingLabelsFormTest < ActionView::TestCase
  setup do
    @user    = User.new
    wrapper_mappings = {
      select: :floating_labels_select
    }
    @builder = SimpleForm::FormBuilder.new(:user, @user, self, wrapper: :floating_labels_form, wrapper_mappings: wrapper_mappings)
  end

  def test_email_field
    actual = @builder.input(:email)
    expected = <<-HTML
      <div class="form-label-group email required user_email">
        <input class="form-control string email required" id="user_email" name="user[email]" placeholder="Enter email" type="email"/>
        <label class="email required" for="user_email">Email <abbr title="required">*</abbr></label>
        <small class="form-text text-muted">We'll never share your email with anyone else.</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_password_field
    actual = @builder.input(:password)
    expected = <<-HTML
      <div class="form-label-group password optional user_password">
        <input class="form-control password optional" id="user_password" name="user[password]" placeholder="Password" type="password"/>
        <label class="password optional" for="user_password">Password</label>
        <small class="form-text text-muted">Password input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_select_field
    actual = @builder.input(:language, collection: %w(a b))
    expected = <<-HTML
      <div class="form-label-group select optional user_language">
        <select class="custom-select select optional" id="user_language" name="user[language]">
          <option label=" " value=""/>
          <option value="a">a</option>
          <option value="b">b</option>
        </select>
        <label class="select optional" for="user_language">Language</label>
        <small class="form-text text-muted">Collection select example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_select_multi_field
    actual = @builder.input(:music, collection: %w(a b), input_html: { multiple: true })
    expected = <<-HTML
      <div class="form-label-group select required user_music">
        <input name="user[music][]" type="hidden" value=""/>
        <select class="custom-select select required" id="user_music" multiple="multiple" name="user[music][]">
          <option value="a">a</option>
          <option value="b">b</option>
        </select>
        <label class="select required" for="user_music">Music <abbr title="required">*</abbr></label>
        <small class="form-text text-muted">Collection multiple select example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_textarea_field
    actual = @builder.input(:bio)
    expected = <<-HTML
      <div class="form-label-group text optional user_bio">
        <textarea class="form-control text optional" id="user_bio" name="user[bio]" placeholder="Tell us your story"></textarea>
        <label class="text optional" for="user_bio">Bio</label>
        <small class="form-text text-muted">Textarea input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end
end
