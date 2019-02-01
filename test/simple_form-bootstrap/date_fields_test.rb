require 'test_helper'

class DateFieldsTest < ActionView::TestCase
  setup do
    @user    = User.new
    @builder = SimpleForm::FormBuilder.new(:user, @user, self, wrapper: :vertical_form, wrapper_mappings: {})
    travel_to Time.zone.local(2015, 10, 21, 07, 28)
  end

  teardown do
    travel_back
  end

  def test_date
    actual = @builder.input(:birthday)
    expected = <<-HTML
      <div class="form-group date required user_birthday">
        <label class="date required" for="user_birthday_1i">Birthday <abbr title="required">*</abbr></label>
        <div class="d-flex flex-row justify-content-between align-items-center">
          <select class="form-control mx-1 date required" id="user_birthday_1i" name="user[birthday(1i)]">
            <option value="2010">2010</option>
            <option value="2011">2011</option>
            <option value="2012">2012</option>
            <option value="2013">2013</option>
            <option value="2014">2014</option>
            <option selected="selected" value="2015">2015</option>
            <option value="2016">2016</option>
            <option value="2017">2017</option>
            <option value="2018">2018</option>
            <option value="2019">2019</option>
            <option value="2020">2020</option>
          </select>
          <select class="form-control mx-1 date required" id="user_birthday_2i" name="user[birthday(2i)]">
            <option value="1">January</option>
            <option value="2">February</option>
            <option value="3">March</option>
            <option value="4">April</option>
            <option value="5">May</option>
            <option value="6">June</option>
            <option value="7">July</option>
            <option value="8">August</option>
            <option value="9">September</option>
            <option selected="selected" value="10">October</option>
            <option value="11">November</option>
            <option value="12">December</option>
          </select>
          <select class="form-control mx-1 date required" id="user_birthday_3i" name="user[birthday(3i)]">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option selected="selected" value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
            <option value="26">26</option>
            <option value="27">27</option>
            <option value="28">28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
          </select>
        </div>
        <small class="form-text text-muted">Date multi select example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_datetime
    actual = @builder.input(:first_kiss, minute_step: 30)
    expected = <<-HTML
      <div class="form-group datetime required user_first_kiss">
        <label class="datetime required" for="user_first_kiss_1i">First kiss <abbr title="required">*</abbr></label>
        <div class="d-flex flex-row justify-content-between align-items-center"><select class="form-control mx-1 datetime required" id="user_first_kiss_1i" name="user[first_kiss(1i)]"><option value="2010">2010</option><option value="2011">2011</option><option value="2012">2012</option><option value="2013">2013</option><option value="2014">2014</option><option selected="selected" value="2015">2015</option><option value="2016">2016</option><option value="2017">2017</option><option value="2018">2018</option><option value="2019">2019</option><option value="2020">2020</option></select><select class="form-control mx-1 datetime required" id="user_first_kiss_2i" name="user[first_kiss(2i)]"><option value="1">January</option><option value="2">February</option><option value="3">March</option><option value="4">April</option><option value="5">May</option><option value="6">June</option><option value="7">July</option><option value="8">August</option><option value="9">September</option><option selected="selected" value="10">October</option><option value="11">November</option><option value="12">December</option></select><select class="form-control mx-1 datetime required" id="user_first_kiss_3i" name="user[first_kiss(3i)]"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option selected="selected" value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
        <select class="form-control mx-1 datetime required" id="user_first_kiss_4i" name="user[first_kiss(4i)]"><option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option selected="selected" value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option></select>
        : <select class="form-control mx-1 datetime required" id="user_first_kiss_5i" name="user[first_kiss(5i)]"><option value="00">00</option><option value="30">30</option></select>
        </div>
        <small class="form-text text-muted">Datetime multi select example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end

  def test_time
    actual = @builder.input(:awake, minute_step: 30)
    expected = <<-HTML
      <div class="form-group time required user_awake">
        <label class="time required" for="user_awake_4i">Awake <abbr title="required">*</abbr></label>
        <div class="d-flex flex-row justify-content-between align-items-center"><input id="user_awake_1i" name="user[awake(1i)]" type="hidden" value="2015"/><input id="user_awake_2i" name="user[awake(2i)]" type="hidden" value="10"/><input id="user_awake_3i" name="user[awake(3i)]" type="hidden" value="21"/><select class="form-control mx-1 time required" id="user_awake_4i" name="user[awake(4i)]"><option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option selected="selected" value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option></select>
        : <select class="form-control mx-1 time required" id="user_awake_5i" name="user[awake(5i)]"><option value="00">00</option><option value="30">30</option></select>
        </div>
        <small class="form-text text-muted">Time multi select example</small>
      </div>
    HTML
    assert_xml_equal expected, actual
  end
end
