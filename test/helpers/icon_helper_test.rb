require 'test_helper'

class IconHelperTest < ActionView::TestCase
  setup do
    raw_xml = <<~XML
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
        <path d="M16 4C9.384 4 4 9.384 4 16s5.384 12 12 12 12-5.384 12-12S22.616 4 16 4zm0 2c5.535 0 10 4.465 10 10s-4.465 10-10 10S6 21.535 6 16 10.465 6 16 6z" />
      </svg>
    XML
    @svg = StringIO.new(raw_xml)
  end

  test "#icon_svg class" do
    assert_match /i class="icon icon-lg d-inline-block"/, icon_svg(@svg, class: "icon icon-lg")
  end

  test "#icon_svg svg" do
    assert_match /path d="M16 4C9.384 4 4 9.384 4 16s5.384 12 12 12 12-5.384 12-12S22.616/, icon_svg(@svg, class: "icon icon-lg")
  end

  test "#icon_svg title" do
    assert_match /title="Icons are awesome"/, icon_svg(@svg, class: "icon", title: "Icons are awesome")
  end

  test "#icon_svg width" do
    assert_match /width="100%"/, icon_svg(@svg)
  end

  test "#icon_svg height" do
    assert_match /height="100%"/, icon_svg(@svg)
  end

  test "#icon_svg preserveAspectRatio" do
    assert_match /preserveAspectRatio="xMaxYMax meet"/, icon_svg(@svg)
  end
end
