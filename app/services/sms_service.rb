class SmsService

  require 'twilio-ruby'

# put your own credentials here
  SID = ENV["SID"]
  AT = ENV["AT"]

# set up a client to talk to the Twilio REST API


  def self.send_sms(message, time)
    message = "#{message} Zosatło: #{time} #{time == 1 ? 'dzień' : 'dni'}"
    @client = Twilio::REST::Client.new SID, AT
    @client.api.account.messages.create(
        from: '+48799448853',
        to: '+48665916834',
        body: message
    )
  end

end