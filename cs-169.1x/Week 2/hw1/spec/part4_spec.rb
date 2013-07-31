require_relative '../part4'

describe "part4" do

  let(:treat) { Dessert.new('cake', 100) }

  it "should have a name for Dessert" do
    treat.name.should == 'cake'
  end

  it "should have the amount of calories" do
    treat.calories.should == 100
  end

  it "should return true if calories < 200" do
    treat.healthy?.should == true
  end

  it "should return false if calories > 200" do
    treat.calories = 9000
    treat.healthy?.should == false
  end

  it "should return true for being delicious" do
    treat.delicious?.should == true
  end

  # jellybean tests here... 

end