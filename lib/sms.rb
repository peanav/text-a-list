class SMS
  def self.connect
    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
  end

  def self.send(opts)
    @client.account.sms.messages.create(
      :from => ENV['TWILIO_NUMBER'],
      :to => opts[:to],
      :body => opts[:body]
    )
  end
end
