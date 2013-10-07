require 'spec_helper'

describe Auction do
  it "should calculate the time remaining on an auction" do	
  	auction = FactoryGirl.build(:auction)
  	expect(auction.time_remaining(auction.remainder)).to eq("01:00:00")

  	auction2 = FactoryGirl.build(:auction, :duration => 3)
  	expect(auction2.time_remaining(auction2.remainder)).to eq("03:00:00")
  end
end
