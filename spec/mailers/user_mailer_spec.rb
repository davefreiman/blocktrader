require "spec_helper"

describe UserMailer do
  describe "won_auction" do
    let(:mail) { UserMailer.won_auction }

    it "renders the headers" do
      mail.subject.should eq("Won auction")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "outbid" do
    let(:mail) { UserMailer.outbid }

    it "renders the headers" do
      mail.subject.should eq("Outbid")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
