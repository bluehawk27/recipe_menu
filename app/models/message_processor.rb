class MessageProcessor
  attr_reader :ingredients, :message, :phone

  def self.process(params)
    new(params).create_message
  end

  def initialize(params)
    @ingredients = get_ingredients params
    @message = get_message ingredients
    @phone = get_phone_number params
  end

  def create_message
    get_client.account.messages.create({:to => "#{phone}",
                                                :from => ENV["TWILIO_NUMBER"],
                                                :body => "Here are the ingredients for your Recipe: #{message}"})
  end

  private

  def get_ingredients(params)
    params[:recipe][:ingredients_attributes].values.each do |item|
      item
    end
  end

  def get_message(ingredients)
    ingredients.map{|x| x['name']}.join(",  ")
  end

  def get_phone_number(params)
    params[:recipe][:phone]
  end

  def get_client
    Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
  end
end
