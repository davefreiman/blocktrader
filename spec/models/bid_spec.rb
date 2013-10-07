require 'spec_helper'

describe Bid do
  it "should not allow a bid lower than the current price" do
  	bid = FactoryGirl.build(:bid)

  	p bid
  end
end
