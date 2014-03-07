class UserMailer < ActionMailer::Base
  default from: "mfpiccolo@gmail.com"

  def request_payment(user_id, entry_id, email)
    @user = User.find(user_id)
    @email = email
    @entry = Entry.find(entry_id)
    mail(to: email, subject: "#{@user.name} has requested a payment")
  end
end
