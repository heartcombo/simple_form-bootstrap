require 'test_helper'

class VerticalFormTest < ActionView::TestCase
  include SimpleForm::ActionViewExtensions::FormHelper

  setup do
    @user    = User.new
    @builder = SimpleForm::FormBuilder.new(:user, @user, self, wrapper: :vertical_form, wrapper_mappings: {})
  end

  def test_vertical_simple_form_for
    actual = simple_form_for @user, url: '/users' do |f| end
    expected = <<-HTML
      <form accept-charset="UTF-8" action="/users" class="simple_form new_user" id="new_user" method="post" novalidate="novalidate"/>
    HTML
    assert_xml_equal expected, actual
  end

  def test_horizontal_simple_form_for
    actual = simple_form_for @user, url: '/users', wrapper: :horizontal_form do |f| end
    expected = <<-HTML
      <form accept-charset="UTF-8" action="/users" class="simple_form new_user" id="new_user" method="post" novalidate="novalidate"/>
    HTML
    assert_xml_equal expected, actual
  end

  def test_inline_simple_form_for
    actual = simple_form_for @user, url: '/users', wrapper: :inline_form, html: { class: "form-inline" } do |f| end
    expected = <<-HTML
      <form accept-charset="UTF-8" action="/users" class="simple_form form-inline" id="new_user" method="post" novalidate="novalidate"/>
    HTML
    assert_xml_equal expected, actual
  end

  def test_input_group_simple_form_for
    actual = simple_form_for @user, url: '/users', wrapper: :input_group do |f| end
    expected = <<-HTML
      <form accept-charset="UTF-8" action="/users" class="simple_form new_user" id="new_user" method="post" novalidate="novalidate"/>
    HTML
    assert_xml_equal expected, actual
  end

  def test_floating_labels_simple_form_for
    actual = simple_form_for @user, url: '/users', wrapper: :floating_labels_form do |f| end
    expected = <<-HTML
      <form accept-charset="UTF-8" action="/users" class="simple_form new_user" id="new_user" method="post" novalidate="novalidate"/>
    HTML
    assert_xml_equal expected, actual
  end
end
