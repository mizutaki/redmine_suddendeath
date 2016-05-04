module SuddenDeath
  def generate(str)
    length = str.each_line.map {|line| line.chomp.length}.max + 2
    top = top(length)
    middle = middle(str)
    bottom = bottom(length)
generate_str = <<-"SD"
＿#{top}＿
#{middle}
￣#{bottom}￣
SD
  end

  private
  def top(count)
    "人" * count
  end
  
  def middle(str)
    tmp = str.each_line.map{|line| line.chomp.insert(0, "＞　")}.join("\n")
    tmp.each_line.map{|line| line.chomp.concat("　＜")}.join("\n")
  end
  
  def bottom(count)
    "Y^" * (count - 2)
  end
end