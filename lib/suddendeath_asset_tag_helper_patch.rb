module ActionView
  module Helpers
    module AssetTagHelper
      def javascript_include_tag_with_suddendeath(*sources)
        p " ---------- javascript_include_tag_with_suddendeath  "
        out = javascript_include_tag_without_suddendeath(*sources)
        if sources.is_a?(Array) and sources[0] == 'jstoolbar/textile'
          out += javascript_tag <<-javascript_tag
jsToolBar.prototype.elements.suddendeath = {
  type: 'button',
  title: 'suddendeath',
  fn: {
    suddendeath: function() { this.encloseSelection("{{sd(",")}}") }
  }
}
javascript_tag
          out += stylesheet_link_tag 'suddendeath', :plugin => 'redmine_suddendeath'
        end
        out
      end
      alias_method_chain :javascript_include_tag, :suddendeath
    end
  end
end
