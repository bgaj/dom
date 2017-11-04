class SmsService

  require 'twilio-ruby'

# put your own credentials here
  SID = '11111111'
  AT = '1111111'

# set up a client to talk to the Twilio REST API


  def self.send_sms
    @client = Twilio::REST::Client.new SID, AT
    @client.api.account.messages.create(
        from: '+48799448853',
        to: '+48665916834',
        body: 'Hey there!'
    )
  end

end