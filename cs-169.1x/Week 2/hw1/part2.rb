class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result?(m1, m2)
  m1p = m1.downcase
  m2p = m2.downcase

  valid_moves = ["r", "p", "s"]

  raise NoSuchStrategyError unless valid_moves.include?(m1p) && valid_moves.include?(m2p)

  case m1p
  when "r"
    m2p != "p"
  when "p"
    m2p != "s"
  when "s"  
    m2p != "r"
  end
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  if rps_result?(game[0][1], game[1][1])
    game[0]
  else
    game[1]
  end
end

def rps_tournament_winner(tournament)
  # borrowed from https://github.com/trun/edx-cs169.1x/blob/master/hw1/part2.rb
  # very cool recursive approach
  roundA, roundB = tournament
  if roundA[0].class == String
    player1 = roundA
    player2 = roundB
  else
    player1 = rps_tournament_winner(roundA)
    player2 = rps_tournament_winner(roundB)
  end
 
  game = []
  game << player1
  game << player2
  
  rps_game_winner(game)
end