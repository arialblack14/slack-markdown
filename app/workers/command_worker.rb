class CommandWorker
  include HTTParty
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(params)
    message = {
      text: "You just sent #{params[:text]}",
      response_type: "in_channel"
    }
    puts "----------------------------------------"
    puts "Message: ", params[:text]
    puts "----------------------------------------"
    HTTParty.post(params[:response_url], { body: message.to_json, headers: {
        "Content-Type" => "application/json"
      }
    })

  end
end
