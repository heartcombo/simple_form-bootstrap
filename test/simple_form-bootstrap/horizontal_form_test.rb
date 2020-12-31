require 'test_helper'

class HorizontalFormTest < ActionView::TestCase
  setup do
    @user    = User.new
    wrapper_mappings = {
      boolean:       :horizontal_boolean,
      check_boxes:   :horizontal_collection,
      date:          :horizontal_multi_select,
      datetime:      :horizontal_multi_select,
      file:          :horizontal_file,
      radio_buttons: :horizontal_collection,
      range:         :horizontal_range,
      time:          :horizontal_multi_select
    }
    @builder = SimpleForm::FormBuilder.new(:user, @user, self, wrapper: :horizontal_form, wrapper_mappings: wrapper_mappings)
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

  def test_collection_as_radio_buttons_inline
    actual = @builder.input(:color, as: :radio_buttons, collection: [:a, :b], wrapper: :horizontal_collection_inline)
    expected = <<-HTML
      <div class="form-group row radio_buttons required user_color">
        <label class="col-sm-3 col-form-label pt-0 radio_buttons required">Color <abbr title="required">*</abbr></label>
        <div class="col-sm-9">
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
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_radio_buttons
    actual = @builder.input(:pill, as: :radio_buttons, collection: [:a, :b])
    expected = <<-HTML
      <div class="form-group row radio_buttons optional user_pill">
        <label class="col-sm-3 col-form-label pt-0 radio_buttons optional">Pill</label>
        <div class="col-sm-9">
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
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_radio_buttons_without_label
    actual = @builder.input(:pill, as: :radio_buttons, collection: [:a, :b], legend_tag: false)
    expected = <<-HTML
      <div class="form-group row radio_buttons optional user_pill">
        <label class="col-sm-3 col-form-label pt-0 radio_buttons optional">Pill</label>
        <div class="col-sm-9">
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
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_check_boxes_inline
    actual = @builder.input(:fruit, as: :check_boxes, collection: [:a, :b], wrapper: :horizontal_collection_inline)
    expected = <<-HTML
      <div class="form-group row check_boxes required user_fruit">
        <label class="col-sm-3 col-form-label pt-0 check_boxes required">Fruit <abbr title="required">*</abbr></label>
        <div class="col-sm-9">
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
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_check_boxes
    actual = @builder.input(:choises, as: :check_boxes, collection: %w(a b))
    expected = <<-HTML
      <div class="form-group row check_boxes required user_choises">
        <label class="col-sm-3 col-form-label pt-0 check_boxes required">Choises <abbr title="required">*</abbr></label>
        <div class="col-sm-9">
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
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_collection_as_check_boxes_without_legend
    actual = @builder.input(:choises, as: :check_boxes, collection: %w(a b), legend_tag: false)
    expected = <<-HTML
      <div class="form-group row check_boxes required user_choises">
        <label class="col-sm-3 col-form-label pt-0 check_boxes required">Choises <abbr title="required">*</abbr></label>
        <div class="col-sm-9">
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
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_boolean_as_radio_button
    actual = @builder.input(:active, as: :radio_buttons)
    expected = <<-HTML
      <div class="form-group row radio_buttons required user_active">
        <label class="col-sm-3 col-form-label pt-0 radio_buttons required">Active <abbr title="required">*</abbr></label>
        <div class="col-sm-9">
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
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_boolean_as_check_box
    actual = @builder.input(:terms)
    expected = <<-HTML
      <div class="form-group row boolean optional user_terms">
        <label class="col-sm-3">Terms</label>
        <div class="col-sm-9">
          <div class="form-check">
            <input name="user[terms]" type="hidden" value="0"/>
            <input class="form-check-input boolean optional" id="user_terms" name="user[terms]" type="checkbox" value="1"/>
            <label class="form-check-label boolean optional" for="user_terms">Terms</label>
            <small class="form-text text-muted">Boolean as check box example</small>
          </div>
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_file_field
    actual = @builder.input(:avatar, as: :file)
    expected = <<-HTML
      <div class="form-group row file required user_avatar">
        <label class="col-sm-3 col-form-label file required" for="user_avatar">Avatar <abbr title="required">*</abbr></label>
        <div class="col-sm-9">
          <input class="file required" id="user_avatar" name="user[avatar]" type="file"/>
          <small class="form-text text-muted">File input example</small>
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_number_field
    actual = @builder.input(:friends)
    expected = <<-HTML
      <div class="form-group row integer optional user_friends">
        <label class="col-sm-3 col-form-label integer optional" for="user_friends">Friends</label>
        <div class="col-sm-9">
          <input class="form-control numeric integer optional" id="user_friends" name="user[friends]" placeholder="Number of Friends" step="1" type="number"/>
          <small class="form-text text-muted">Integer input example</small>
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_password_field
    actual = @builder.input(:password)
    expected = <<-HTML
      <div class="form-group row password optional user_password">
        <label class="col-sm-3 col-form-label password optional" for="user_password">Password</label>
        <div class="col-sm-9">
          <input class="form-control password optional" id="user_password" name="user[password]" placeholder="Password" type="password"/>
          <small class="form-text text-muted">Password input example</small>
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_range_field
    actual = @builder.input(:mood, as: :range)
    expected = <<-HTML
      <div class="form-group row range optional user_mood">
        <label class="col-sm-3 col-form-label range optional" for="user_mood">Mood</label>
        <div class="col-sm-9">
          <input class="form-control-range numeric range optional" id="user_mood" name="user[mood]" step="1" type="range"/>
          <small class="form-text text-muted">Integer range example</small>
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_select_field
    actual = @builder.input(:language, collection: %w(a b))
    expected = <<-HTML
      <div class="form-group row select optional user_language">
        <label class="col-sm-3 col-form-label select optional" for="user_language">Language</label>
        <div class="col-sm-9">
          <select class="form-control select optional" id="user_language" name="user[language]">
            <option label=" " value=""/>
            <option value="a">a</option>
            <option value="b">b</option>
          </select>
          <small class="form-text text-muted">Collection select example</small>
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_select_multi_field
    actual = @builder.input(:music, collection: %w(a b), input_html: { multiple: true })
    expected = <<-HTML
      <div class="form-group row select required user_music">
        <label class="col-sm-3 col-form-label select required" for="user_music">Music <abbr title="required">*</abbr></label>
        <div class="col-sm-9">
          <input name="user[music][]" type="hidden" value=""/>
          <select class="form-control select required" id="user_music" multiple="multiple" name="user[music][]">
            <option value="a">a</option>
            <option value="b">b</option>
          </select>
          <small class="form-text text-muted">Collection multiple select example</small>
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_text_field
    actual = @builder.input(:name)
    expected = <<-HTML
      <div class="form-group row string required user_name">
        <label class="col-sm-3 col-form-label string required" for="user_name">Name <abbr title="required">*</abbr></label>
        <div class="col-sm-9">
          <input class="form-control string required" id="user_name" name="user[name]" placeholder="Your name" type="text"/>
          <small class="form-text text-muted">Text input example</small>
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_textarea_field
    actual = @builder.input(:bio)
    expected = <<-HTML
      <div class="form-group row text optional user_bio">
        <label class="col-sm-3 col-form-label text optional" for="user_bio">Bio</label>
        <div class="col-sm-9">
          <textarea class="form-control text optional" id="user_bio" name="user[bio]" placeholder="Tell us your story"></textarea>
          <small class="form-text text-muted">Textarea input example</small>
        </div>
      </div>
    HTML
    assert_xml_equal expected, actual
  end
end
