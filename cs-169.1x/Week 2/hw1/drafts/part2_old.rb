class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def count_subarrays(array)
  return 0 unless array && array.is_a?(Array)

  nested = array.select { |e| e.is_a?(Array) }
  if nested.empty?
    1 # this is a leaf
  else
    nested.inject(0) { |sum, ary| sum + count_subarrays(ary) }
  end
end

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

  if tournament.length != 1
  tournament.each do |section|
    semi_finalists = []

    puts tournament.length
    puts section.length
    section.each do |round|
      semi_finalists << rps_game_winner(round)
    end
    puts "Semi Inspect:" + semi_finalists.inspect
    
    if semi_finalists.length == 1
      finalists << semi_finalists[0]
    else
      finalists << rps_game_winner(semi_finalists)
      puts "Finalist:" + finalists.inspect
    end 
    if finalists.length == 2
        puts "Running finalist check"
        finalists = [rps_game_winner(finalists)]
        puts finalists
     end
  end
  return finalists[0]
  elsif tournament.length == 1
    rps_game_winner(tournament[0])
  else
   puts "UNEXPECTED ERROR"
  end
end

puts rps_game_winner([["Max", "R"], ["Bob", "S"]])

a = [
#    [
        [ ["Armando", "P"], ["Dave", "S"] ],
#        [ ["Richard", "R"],  ["Michael", "S"] ],
#    ],
#    [
#        [ ["Allen", "S"], ["Omer", "P"] ],
#        [ ["David E.", "R"], ["Richard X.", "P"] ]
#    ],
#    [   [ ["Thug", "S"], ["Gangstar", "R"]  ],
#        [ ["Bar", "R"], ["Ice", "S"] ]
#    ],
#    [ [["Tyson", "P"], ["Byrce", "P"]], [["Jackl", "P"], ["Smitt", "P"]] ]
]

puts rps_tournament_winner(a).inspect
