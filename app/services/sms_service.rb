class SmsService

  require 'twilio-ruby'

# put your own credentials here
  SID = 'AC649c4bc0787774ea2b44800e7540e886'
  AT = '59d95bc5b0f402845d8cd71cf2c3d6be'

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