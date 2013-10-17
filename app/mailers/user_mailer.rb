class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.won_auction.subject
  #
  def won_auction(auction)
    @auction = auction
    @user = @auction.winner

    mail(:to => @user.email, :subject => "You won an auction for #{@auction.name} on  Blocktrader!")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.outbid.subject
  #
  def outbid
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
