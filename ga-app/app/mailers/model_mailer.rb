class ModelMailer < ActionMailer::Base
  default from: "postmaster@sandbox716a751d8ff044b9baec915e7d668de3.mailgun.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_event_notification.subject
  #
  def new_event_notification(event, creator)
    @event = event
    @creator = creator

    #using my email for now. Should swap in different emails as necessary.
    mail to: "#{@creator}", subject: "Success! You did it."
  end

end
