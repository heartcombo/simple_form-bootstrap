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
        <label class="email required" for="user_email">Email <abbr title="required">*</abbr></label>
        <input class="form-control string email required" id="user_email" name="user[email]" placeholder="Enter email" type="email"/>
        <small class="form-text text-muted">We'll never share your email with anyone else.</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_radio_buttons_inline
    actual = @builder.input(:color, as: :radio_buttons, collection: [:a, :b], wrapper: :vertical_collection_inline)
    expected = <<-HTML
      <fieldset class="form-group radio_buttons required user_color">
        <legend class="col-form-label pt-0">Color <abbr title="required">*</abbr></legend>
        <input name="user[color]" type="hidden" value=""/>
        <div class="form-check form-check-inline">
          <input class="form-check-input radio_buttons required" id="user_color_a" name="user[color]" type="radio" value="a"/>
          <label class="form-check-label collection_radio_buttons" for="user_color_a">a</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input radio_buttons required" id="user_color_b" name="user[color]" type="radio" value="b"/>
          <label class="form-check-label collection_radio_buttons" for="user_color_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as inline radio buttons example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_radio_buttons
    actual = @builder.input(:pill, as: :radio_buttons, collection: [:a, :b])
    expected = <<-HTML
      <fieldset class="form-group radio_buttons optional user_pill">
        <legend class="col-form-label pt-0">Pill</legend>
        <input name="user[pill]" type="hidden" value=""/>
        <div class="form-check">
          <input class="form-check-input radio_buttons optional" id="user_pill_a" name="user[pill]" type="radio" value="a"/>
          <label class="form-check-label collection_radio_buttons" for="user_pill_a">a</label>
        </div>
        <div class="form-check">
          <input class="form-check-input radio_buttons optional" id="user_pill_b" name="user[pill]" type="radio" value="b"/>
          <label class="form-check-label collection_radio_buttons" for="user_pill_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as radio buttons example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_radio_buttons_without_label
    actual = @builder.input(:pill, as: :radio_buttons, collection: [:a, :b], legend_tag: false)
    expected = <<-HTML
      <fieldset class="form-group radio_buttons optional user_pill">
        <input name="user[pill]" type="hidden" value=""/>
        <div class="form-check">
          <input class="form-check-input radio_buttons optional" id="user_pill_a" name="user[pill]" type="radio" value="a"/>
          <label class="form-check-label collection_radio_buttons" for="user_pill_a">a</label>
        </div>
        <div class="form-check">
          <input class="form-check-input radio_buttons optional" id="user_pill_b" name="user[pill]" type="radio" value="b"/>
          <label class="form-check-label collection_radio_buttons" for="user_pill_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as radio buttons example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_check_boxes_inline
    actual = @builder.input(:fruit, as: :check_boxes, collection: [:a, :b], wrapper: :vertical_collection_inline)
    expected = <<-HTML
      <fieldset class="form-group check_boxes required user_fruit">
        <legend class="col-form-label pt-0">Fruit <abbr title="required">*</abbr></legend>
        <input name="user[fruit][]" type="hidden" value=""/>
        <div class="form-check form-check-inline">
          <input class="form-check-input check_boxes required" id="user_fruit_a" name="user[fruit][]" type="checkbox" value="a"/>
          <label class="form-check-label collection_check_boxes" for="user_fruit_a">a</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input check_boxes required" id="user_fruit_b" name="user[fruit][]" type="checkbox" value="b"/>
          <label class="form-check-label collection_check_boxes" for="user_fruit_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as inline check boxes example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_check_boxes
    actual = @builder.input(:choises, as: :check_boxes, collection: %w(a b))
    expected = <<-HTML
      <fieldset class="form-group check_boxes required user_choises">
        <legend class="col-form-label pt-0">Choises <abbr title="required">*</abbr></legend>
        <input name="user[choises][]" type="hidden" value=""/>
        <div class="form-check">
          <input class="form-check-input check_boxes required" id="user_choises_a" name="user[choises][]" type="checkbox" value="a"/>
          <label class="form-check-label collection_check_boxes" for="user_choises_a">a</label>
        </div>
        <div class="form-check">
          <input class="form-check-input check_boxes required" id="user_choises_b" name="user[choises][]" type="checkbox" value="b"/>
          <label class="form-check-label collection_check_boxes" for="user_choises_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as check boxes example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_check_boxes_without_legend
    actual = @builder.input(:choises, as: :check_boxes, collection: %w(a b), legend_tag: false)
    expected = <<-HTML
      <fieldset class="form-group check_boxes required user_choises">
        <input name="user[choises][]" type="hidden" value=""/>
        <div class="form-check">
          <input class="form-check-input check_boxes required" id="user_choises_a" name="user[choises][]" type="checkbox" value="a"/>
          <label class="form-check-label collection_check_boxes" for="user_choises_a">a</label>
        </div>
        <div class="form-check">
          <input class="form-check-input check_boxes required" id="user_choises_b" name="user[choises][]" type="checkbox" value="b"/>
          <label class="form-check-label collection_check_boxes" for="user_choises_b">b</label>
        </div>
        <small class="form-text text-muted">Collection as check boxes example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_boolean_as_radio_button
    actual = @builder.input(:active, as: :radio_buttons)
    expected = <<-HTML
      <fieldset class="form-group radio_buttons required user_active">
        <legend class="col-form-label pt-0">Active <abbr title="required">*</abbr></legend>
        <input name="user[active]" type="hidden" value=""/>
        <div class="form-check">
          <input class="form-check-input radio_buttons required" id="user_active_true" name="user[active]" type="radio" value="true"/>
          <label class="form-check-label collection_radio_buttons" for="user_active_true">Yes</label>
        </div>
        <div class="form-check">
          <input class="form-check-input radio_buttons required" id="user_active_false" name="user[active]" readonly="readonly" type="radio" value="false"/>
          <label class="form-check-label collection_radio_buttons" for="user_active_false">No</label>
        </div>
        <small class="form-text text-muted">Boolean as radio button example</small>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_boolean_as_check_box
    actual = @builder.input(:terms)
    expected = <<-HTML
      <fieldset class="form-group boolean optional user_terms">
        <div class="form-check">
          <input name="user[terms]" type="hidden" value="0"/>
          <input class="form-check-input boolean optional" id="user_terms" name="user[terms]" type="checkbox" value="1"/>
          <label class="form-check-label boolean optional" for="user_terms">Terms</label>
          <small class="form-text text-muted">Boolean as check box example</small>
        </div>
      </fieldset>
    HTML
    assert_xml_equal expected, actual
  end

  def test_file_field
    actual = @builder.input(:avatar, as: :file)
    expected = <<-HTML
      <div class="form-group file required user_avatar">
        <label class="file required" for="user_avatar">Avatar <abbr title="required">*</abbr></label>
        <input class="form-control-file file required" id="user_avatar" name="user[avatar]" type="file"/>
        <small class="form-text text-muted">File input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_number_field
    actual = @builder.input(:friends)
    expected = <<-HTML
      <div class="form-group integer optional user_friends">
        <label class="integer optional" for="user_friends">Friends</label>
        <input class="form-control numeric integer optional" id="user_friends" name="user[friends]" placeholder="Number of Friends" step="1" type="number"/>
        <small class="form-text text-muted">Integer input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_password_field
    actual = @builder.input(:password)
    expected = <<-HTML
      <div class="form-group password optional user_password">
        <label class="password optional" for="user_password">Password</label>
        <input class="form-control password optional" id="user_password" name="user[password]" placeholder="Password" type="password"/>
        <small class="form-text text-muted">Password input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_range_field
    actual = @builder.input(:mood, as: :range)
    expected = <<-HTML
      <div class="form-group range optional user_mood">
        <label class="range optional" for="user_mood">Mood</label>
        <input class="form-control-range numeric range optional" id="user_mood" name="user[mood]" step="1" type="range"/>
        <small class="form-text text-muted">Integer range example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_select_field
    actual = @builder.input(:language, collection: %w(a b))
    expected = <<-HTML
      <div class="form-group select optional user_language">
        <label class="select optional" for="user_language">Language</label>
        <select class="form-control select optional" id="user_language" name="user[language]">
          <option label=" " value=""/>
          <option value="a">a</option>
          <option value="b">b</option>
        </select>
        <small class="form-text text-muted">Collection select example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_select_multi_field
    actual = @builder.input(:music, collection: %w(a b), input_html: { multiple: true })
    expected = <<-HTML
      <div class="form-group select required user_music">
        <label class="select required" for="user_music">Music <abbr title="required">*</abbr></label>
        <input name="user[music][]" type="hidden" value=""/>
        <select class="form-control select required" id="user_music" multiple="multiple" name="user[music][]">
          <option value="a">a</option>
          <option value="b">b</option>
        </select>
        <small class="form-text text-muted">Collection multiple select example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_text_field
    actual = @builder.input(:name)
    expected = <<-HTML
      <div class="form-group string required user_name">
        <label class="string required" for="user_name">Name <abbr title="required">*</abbr></label>
        <input class="form-control string required" id="user_name" name="user[name]" placeholder="Your name" type="text"/>
        <small class="form-text text-muted">Text input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_textarea_field
    actual = @builder.input(:bio)
    expected = <<-HTML
      <div class="form-group text optional user_bio">
        <label class="text optional" for="user_bio">Bio</label>
        <textarea class="form-control text optional" id="user_bio" name="user[bio]" placeholder="Tell us your story"></textarea>
        <small class="form-text text-muted">Textarea input example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end
end
