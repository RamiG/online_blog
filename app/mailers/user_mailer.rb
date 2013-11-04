class UserMailer < ActionMailer::Base
  def signup_notification(user)    
    mail(to: user.email, subject: "Registration successful", from: "ramig.1985@gmail.com")
  end
end
