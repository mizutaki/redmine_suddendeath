require 'suddendeath_asset_tag_helper_patch'
require 'sudden_death'

include SuddenDeath

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
      str = args.first.strip
      generate_str = SuddenDeath.generate(str)
      textilizable(generate_str, {:object=>nil, :attachments=>[]})
    end
  end
end
