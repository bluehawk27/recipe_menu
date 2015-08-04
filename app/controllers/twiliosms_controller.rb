require 'twilio-ruby'
class TwiliosmsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def send_sms
   # put this in a helper later
    ingredients = params[:recipe][:ingredients_attributes].values.each do |item|
      item
    end

    message = ingredients.map{|x| x['name']}.join(",  ")
    phone = params[:recipe][:phone]

    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])

    @message = @client.account.messages.create({:to => "#{phone}",
                                        :from => "+16502521651",
                                       :body => "Here are the ingredients for your Recipe: #{message}"})

    redirect_to root_path
  end

end
