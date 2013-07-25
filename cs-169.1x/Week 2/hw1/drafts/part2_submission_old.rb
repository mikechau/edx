class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  valid_moves = ["r", "p", "s"]
  p1_move = m1[1].downcase
  p2_move = m2[1].downcase
  raise NoSuchStrategyError unless valid_moves.include?(p1_move) && valid_moves.include?(p2_move)

  case p1_move
  when "r"
    p2_move == "p" ? m2 : m1
  when "p"
    p2_move == "s" ? m2 : m1
  when "s"
    p2_move == "r" ? m2 : m1
  end
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  rps_result(game[0], game[1]) 
end

def rps_tournament_winner(tournament)
  finalists = []
  tournament.each do |section|
    semi_finalists = []

    section.each do |round|
      semi_finalists << rps_game_winner(round)
    end
    
    if semi_finalists.length == 1
      finalists << semi_finalists[0]
    else
      finalists << rps_game_winner(semi_finalists)
    end 
    if finalists.length == 2
        finalists = [rps_game_winner(finalists)]
     end
  end
  finalists[0]
end
