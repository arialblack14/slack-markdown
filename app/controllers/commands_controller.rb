class CommandsController < ApplicationController
  def create
  return render json: {}, status: 403 unless valid_slack_token?
    CommandWorker.perform_async(command_params.to_h)
    render json: { response_type: "in_channel" }, status: :created
  end

  private

    def valid_slack_token?
      params[:token] == ENV["SLACK_SLASH_COMMAND_TOKEN"]
    end

    # Only allow a trusted parameter "white list" through.
    def command_params
      params.permit(:text, :token, :user_id, :response_url, :team_id, :team_domain, :channel_id,
                    :channel_name, :user_name, :command, :trigger_id)
    end
end
