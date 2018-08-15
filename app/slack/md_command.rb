class  MarkdCommand < Slackathon::Command
  def call
    {
      response_type: "in_channel",
      text: "#{user} said #{params[:text]} :see_no_evil:"
    }
  end

  private

  def user
    "<@#{params[:user_id]}>"
  end
end