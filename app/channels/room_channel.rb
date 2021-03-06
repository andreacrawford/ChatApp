# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def listen(data)
    stop_all_streams
    stream_for data["room_id"]
  end

  #def send_message(data)
   # current_user.messages.create!(body: data['message'}], room_id: data["room_id"])
  #end

end