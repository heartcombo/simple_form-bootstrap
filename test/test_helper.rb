ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'minitest/autorun'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  extend Minitest::Spec::DSL
  include ErrorMessagesHelper
  include IconHelper
  include InlineSvg::ActionView::Helpers
end

# credits to bootstrap-form
class ActionView::TestCase
  # Expected and actual are wrapped in a root tag to ensure proper XML structure.
  def assert_xml_equal(expected, actual)
    expected_xml = Nokogiri::XML("<test-xml>\n#{expected}\n</test-xml>", &:noblanks)
    actual_xml   = Nokogiri::XML("<test-xml>\n#{actual}\n</test-xml>", &:noblanks)

    equivalent = EquivalentXml.equivalent?(expected_xml, actual_xml)
    assert equivalent, -> {
      # using a lambda because diffing is expensive
      Diffy::Diff.new(
        sort_attributes(expected_xml.root).to_xml(indent: 2),
        sort_attributes(actual_xml.root).to_xml(indent: 2)
      ).to_s
    }
  end

  private

    def sort_attributes(doc)
      return if doc.blank?
      doc.dup.traverse do |node|
        if node.is_a?(Nokogiri::XML::Element)
          attributes = node.attribute_nodes.sort_by(&:name)
          attributes.each do |attribute|
            node.delete(attribute.name)
            node[attribute.name] = attribute.value
          end
        end
        node
      end
    end
end
