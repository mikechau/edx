require_relative '../part2'

describe "part2" do

  two_players = [ ["Armando", "P"], ["Dave", "S"] ]
  eight_players = [[[["Armando","P"],["Dave","S"]],[["Richard","R"],["Michael","S"]],],[[["Allen","S"],["Omer","P"]],[["DavidE.","R"],["RichardX.","P"]]]]
  sixteen_players = [[[["Armando","P"],["Dave","S"]],[["Richard","R"],["Michael","S"]],],[[["Allen","S"],["Omer","P"]],[["DavidE.","R"],["RichardX.","P"]]],[[["Allen","S"],["Omer","P"]],[["DavidE.","R"],["RichardX.","P"]]],[[["Allen","S"],["Omer","P"]],[["DavidE.","R"],["RichardX.","P"]]]]
  thirtytwo_players = [[[["Armando","P"],["Dave","S"]],[["Richard","R"],["Michael","S"]],],[[["Allen","S"],["Omer","P"]],[["DavidE.","R"],["RichardX.","P"]]],[[["Allen","S"],["Omer","P"]],[["DavidE.","R"],["RichardX.","P"]]],[[["Allen","S"],["Omer","P"]],[["DavidE.","R"],["RichardX.","P"]]],[[["Allen","S"],["Omer","P"]],[["DavidE.","R"],["RichardX.","P"]]],[[["Allen","S"],["Omer","P"]],[["DavidE.","R"],["RichardX.","P"]]],[[["Allen","S"],["Omer","P"]],[["DavidE.","R"],["RichardX.","P"]]],[[["Allen","S"],["Omer","P"]],[["DavidE.","R"],["RichardX.","P"]]]]

  # rps_result
  it "should raise an error if there is an invalid move" do
    expect { rps_result?("x", "sss") }.to raise_error(NoSuchStrategyError)
  end

  it "should return true if player 1 wins" do
    rps_result?('p', 'r').should == true 
  end

  it "should return false if player 1 loses" do
    rps_result?('r', 'p').should == false
  end

  it "should return true if player 1 ties" do
    rps_result?('s', 's').should == true
  end

  # rps_game_winner
  it "should raise an error if there are not 2 players" do
    expect { rps_game_winner([["one"]]) }.to raise_error(WrongNumberOfPlayersError)
  end

  it "should return the winner and their move" do
    game = [ ["Armando", "P"], ["Dave", "S"] ]
    rps_game_winner(game).should == ["Dave", "S"]
  end

  # rps_tournament_winner
  it "should return the winner if there is only one game" do
    tournament = [ ["Armando", "P"], ["Dave", "S"] ]
    rps_tournament_winner(tournament).should == ["Dave", "S"]
  end

  it "should return the correct winner for a 8 player game" do
    rps_tournament_winner(eight_players).should == ["Richard", "R"]
  end

  it "should return the correct winner for a 8 player game" do
    rps_tournament_winner(sixteen_players).should == ["Richard", "R"]
  end

  it "should return the correct winner for a 8 player game" do
    rps_tournament_winner(thirtytwo_players).should == ["Richard", "R"]
  end
end
