class MessageMailer < ApplicationMailer

  default from: 'selfdestructmsg@gmail.com'
 
  def sd_message(message)
    @message = message
    @url  = 'http://example.com/login'
    mail(to: @message.recipient, subject: 'A Message')
  end

end
