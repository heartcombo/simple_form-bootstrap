require 'test_helper'

class ErrorMessagesHelperTest < ActionView::TestCase
  describe "#error_messages_for" do
    before do
      @model = users(:invalid)
      @model.valid?
    end

    it "display error messages as html" do
      _(error_messages_for(@model)).must_match '<div class="alert alert-danger alert-form alert-dismissible">'
      _(error_messages_for(@model)).must_match '<a href="#" class="close" data-dismiss="alert">×</a>'
      _(error_messages_for(@model)).must_match '<h6 class="text-uppercase text-reset my-1">'
      _(error_messages_for(@model)).must_match '<p>There were problems with the'
      _(error_messages_for(@model)).must_match '<li>Name is too short (minimum is 3 characters)</li>'
    end
  end
end
