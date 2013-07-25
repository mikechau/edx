require_relative '../part3'

describe "part3" do

  it "should return an array of anagrams" do
    input = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']

    output = [["cars", "racs", "scar"], ["for"], ["potatoes"], ["four"], ["creams", "scream"]] 

    combine_anagrams(input).should == output
  end

end