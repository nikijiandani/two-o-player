require_relative 'player'

class Game 

  def initialize

    player1 = Player.new('Player 1')
    player2 = Player.new('Player 2')
    @players = [player1, player2]

  end

  def play
    while(!game_over?)

      pad "NEW TURN"

      random_number1 = generate_new_number
      random_number2 = generate_new_number
      total = random_number1 + random_number2

      puts "#{@players[0].name}: What does #{random_number1} plus #{random_number2} equal?"

      print "> "
      answer = $stdin.gets.chomp.to_i

      if(answer == total)
        puts "#{@players[0].name}: YES! You are correct."
      else
        puts "#{@players[0].name}: Seriously? No!"
        @players[0].lives -= 1
      end

      puts "#{@players[0].name}: #{@players[0].lives}/3 vs #{@players[1].name}: #{@players[1].lives}/3"
      @players = @players.reverse!

    end
    winning_player = winner[0]
    puts "*********************************"
    puts "#{winning_player.name} wins with a score of #{winning_player.lives}"
    puts "*********************************"
    pad "GAME OVER"
  end

  def pad(message)
    puts
    puts "=== #{message} ==="
    puts
  end

  def winner
    @players.filter { |p| !p.dead? }
  end

  def game_over?
    @players[0].lives <= 0 || @players[1].lives <= 0
  end

  def generate_new_number
    rand(1..20)
  end

end