require_relative 'player'

class Game 

  def initialize

    player1 = Player.new('Player 1')
    player2 = Player.new('Player 2')
    @players = [player1, player2]
    @current_player_index = 0
  end

  def play
    while(!game_over?)

      pad "NEW TURN"

      random_number1 = generate_new_number
      random_number2 = generate_new_number
      total = random_number1 + random_number2

      puts "#{current_player.name}: What does #{random_number1} plus #{random_number2} equal?"

      print "> "
      answer = $stdin.gets.chomp.to_i

      if(answer == total)
        puts "#{current_player.name}: YES! You are correct."
      else
        puts "#{current_player.name}: Seriously? No!"
        current_player.lose_a_life
      end

      puts "#{current_player.name}: #{current_player.lives}/3 vs #{other_player.name}: #{other_player.lives}/3"

      swap_players()
    
    end

    winning_player = winner
    puts "*********************************"
    puts "#{winning_player.name} wins with a score of #{winning_player.lives}"
    puts "*********************************"
    pad "GAME OVER"
  end

  def swap_players
    @current_player_index = other_player_index
  end

  def current_player
    @players[@current_player_index]
  end

  def other_player_index
    if @current_player_index == 1
      0
    else
      1
    end
   # @current_player_index = @current_player_index + 1 % @players.count
  end

  def other_player
    @players[other_player_index]
  end

  def pad(message)
    puts
    puts "=== #{message} ==="
    puts
  end

  def winner
    @players.filter { |p| !p.dead? }.first
  end

  def game_over?
    current_player.lives <= 0 || other_player.lives <= 0
  end

  def generate_new_number
    rand(1..20)
  end

end