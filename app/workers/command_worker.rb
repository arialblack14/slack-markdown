require 'httparty'

class CommandWorker
  include HTTParty
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(params)
    params = params.symbolize_keys
    message = {
      text: "You just sent #{params[:text]}",
      response_type: "in_channel"
    }
    puts "----------------------------------------"
    puts "Message: ", params.inspect
    puts "----------------------------------------"
    HTTParty.post(params[:response_url], { body: message.to_json, headers: {
        "Content-Type" => "application/json"
      }
    })

  end
end
