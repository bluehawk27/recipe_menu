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
                                                :from => ENV["TWILIO_NUMBER"],
                                                :body => "Here are the ingredients for your Recipe: #{message}"})
    redirect_to root_path
  end

  def process_sms
    if
      @recipe = Recipe.find_by(title: params[:Body])
      render 'process_sms.xml.erb', :content_type => 'text/xml'
    else
      render 'no_recipe.xml.erb', :content_type => 'text/xml'
    end
  end
end
