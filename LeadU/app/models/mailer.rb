class Mailer < ActionMailer::Base
  default from: 'from@example.com'
  def send_to(content) 
    @url  = 'http://example.com/login'
    mail(to: content[:email], body: content[:body], subject: content[:subject])
  end
end