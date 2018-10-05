class WelcomeMailer < ApplicationMailer
  def welcome_send(user)
    @user = user
    mail to: user.email, subject: "Welcome to conference room management", from: "neerajlivewire@gmail.com"
  end
end
