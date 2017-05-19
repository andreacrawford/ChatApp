class MessagesController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @user = current_user.first_name

    if @message.save
      #ActionCable.server.broadcast 'room_channel', message: @message.body, user: @message.user.first_name
      RoomChannel.broadcast_to @room.id, message: @message.body, user: @message.user.first_name
    else
      redirect_to rooms_path
    end
  end

private

  def message_params
    params.require(:message).permit(:user_id, :body, :room_id)
  end

end