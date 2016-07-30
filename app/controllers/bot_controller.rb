class BotController < ApplicationController
  PAGE_ACCESS_TOKEN = "EAAXWL2ZBAUOsBALbIFcSZBttUJxbdhZAd8WZAOaQh1uDAuUTv4YRuGoTzN8I3kNrZAZBM5EKzsPTqL9ja8wDyLHGQZBdkOjVweQXkKngPbashCQwB6pE2v7phNAnE2JTT2SfMRwROd0DdNNMeMPlcirjHsZCP9Is27xp2pZAy0MzlBwZDZD"

  # GET /bot/webhook
  def webhook
    if params['hub.verify_token'] == 'hogehoge'
      render text: params['hub.challenge']
    else
      render text: 'Error, wrong validation token'
    end
  end

  # POST /bot/webhook
  def receive_message
    if params[:entry]
      messaging_events = params[:entry][0][:messaging]
      messaging_events.each do |event|
        sender = event[:sender][:id]
        if (text = event[:message] && event[:message][:text])
          send_text_message(sender, "\"#{text}\" cái cc")
        end
      end
    end
    render nothing: true
  end

  def send_text_message(senderId, message)
    url = "https://graph.facebook.com/v2.6/me/messages?access_token=#{PAGE_ACCESS_TOKEN}"
    body = {recipient: {id: senderId},
            message: {text: message}
          }.to_json
    response = HTTParty.post(url, body: body, headers: {'Content-Type' => 'application/json'})
  end

  def handle_search_text
    return unless params[:text]
    @sicks = Sickness.search(params[:text])
  end
end
