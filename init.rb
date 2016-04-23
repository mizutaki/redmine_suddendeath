Redmine::Plugin.register :suddendeath do
  name 'Suddendeath plugin'
  author 'mizutaki'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/mizutaki/redmine_suddendeath'
  author_url 'http://example.com/about'
end

Redmine::WikiFormatting::Macros.register do
  desc "string decoration suddendeath"
  macro :sd do |obj, args|
    if (args.size != 1)
      raise "string decoration macro is given only argument."
    else
      word = args.first.strip
      addr = "http://ja.wikipedia.org/wiki/" + CGI.escape(word)
      return link_to(word, addr, :class => "external")
    end
  end
end
