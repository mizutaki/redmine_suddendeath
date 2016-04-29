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
      org_strmax = str.each_line.map {|line| line.chomp.length}.max + 2
      middle = str.each_line.map{|line| line.chomp.insert(0, "＞　")}.join("\n")
      middle = middle.each_line.map{|line| line.chomp.insert(org_strmax, "　＜")}.join("\n")
      middle_strmax = middle.each_line.map{|line| line.chomp.length}.max
      top = "人" * org_strmax
      bottom = "Y^" * org_strmax
decoration_str = <<"EOS"
#{top}
#{middle}
#{bottom}
EOS
      textilizable(decoration_str, {:object=>nil, :attachments=>[]})
    end
  end
end
