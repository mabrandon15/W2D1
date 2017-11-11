class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    until @game_over == true
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    puts "Gimme good guesses!"
    @seq.each do |color|
      guess = gets.downcase.chomp
      if COLORS.include?(guess) == false
        raise "Gimme red, blue, green, or yellow"
      else
        if color[0] != guess
          @game_over = true
          break
        end
      end
    end 
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Good job! It matches!"
  end

  def game_over_message
    puts "Game over. =("
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
