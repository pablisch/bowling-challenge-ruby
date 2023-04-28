require_relative './game'
require_relative './frame'
require_relative './score'

class User


  def run
    game = Game.new
    while game.roll_again?
      frame_number = game.frames.length + 1
      # puts "frame no. = #{frame_number}" # VISIBILTY
      puts "no of frames in 'frames' #{game.frames.length}"  # VISIBILTY
      game.add_roll(roll(frame_number, 1))
      puts "strike status = #{game.strike?}"  # VISIBILTY
      game.add_roll(roll(frame_number, 2)) unless game.strike?
      game.add_roll(roll(frame_number, 3)) if game.bonus_roll()
    end
    puts "You scored #{score(game)}"  # not sure if there will be any parameters yet
      # score() may end up being @game.score or suchlike
  end

  def roll(frame, roll)
    puts "Pins down for frame #{frame} roll #{roll}?"
    return gets.chomp.to_i
  end

  # def score(score)
  #   puts "\nYou scored #{score} points!"
  # end
  
  def score(game)
    game.scores()
  end
end

if __FILE__ == $0
  
  user = User.new
  user.run
end

