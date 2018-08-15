require 'httparty'
require 'redcarpet'
require 'redcarpet/render_strip'

class CommandWorker
  include HTTParty
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(params)
    params = params.symbolize_keys
    md = init_markdown

    message = {
      text: md.render(params[:text]),
      response_type: "ephemeral"
    }
    puts "----------------------------------------"
    puts "Message: ", params.inspect
    puts "----------------------------------------"
    HTTParty.post(params[:response_url], { body: message.to_json, headers: {
        "Content-Type" => "application/json"
      }
    })
  end

  private

    def init_markdown
      Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    end
end
