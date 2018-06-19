require 'test_helper'

class LayoutHelperTest < ActionView::TestCase

  test '#controller?' do
    assert_equal false, controller?('wrong-controller')
  end

  test '#is_active? page returns true for current_page?' do
    stub :current_page?, true do
      assert_equal 'active', is_active?('pages/current/path')
    end
  end

  test '#is_active? page returns nil on any other page' do
    stub :current_page?, false do
      assert_nil is_active?('pages/other/path')
    end
  end
end
