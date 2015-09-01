require 'twilio-ruby'
class TwiliosmsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def send_sms
    MessageProcessor.process params
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
