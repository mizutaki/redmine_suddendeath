module ActionView
  module Helpers
    module AssetTagHelper
      def javascript_include_tag_with_suddendeath(*sources)
        out = javascript_include_tag_without_suddendeath(*sources)
        if sources.is_a?(Array) and sources[0] == 'jstoolbar/jstoolbar-textile.min'
          out += javascript_tag <<-javascript_tag
jsToolBar.prototype.elements.suddendeath = {
  type: 'button',
  title: '突然の死',
  fn: {
    wiki: function() { this.encloseSelection("{{sd(", ")}}") }
  }
}
javascript_tag
         out += stylesheet_link_tag 'suddendeath', :plugin => 'suddendeath'
        end
        out
      end
      alias_method_chain :javascript_include_tag, :suddendeath
    end
  end
end
