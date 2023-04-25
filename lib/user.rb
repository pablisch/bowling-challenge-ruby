class User
  def roll(frame, roll)
    puts "Pins down for frame #{frame} roll #{roll}?"
    return gets.chomp.to_i
  end

  def score(score)
    puts "\nYou scored #{score} points!"
  end
end

# if __FILE__ == $0
#   user = User.new
#   user.run
# end