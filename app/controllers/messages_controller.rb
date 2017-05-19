class MessagesController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @user = current_user
    respond_to do |format|


      if @message.save!
        #ActionCable.server.broadcast 'room_channel', message: @message.body, user: @message.user.first_name
        RoomChannel.broadcast_to @room.id, message: @message.body, user: @user.first_name
        format.js
      else
        redirect_to rooms_path
      end
    end
  end

private

  def message_params
    params.require(:message).permit(:user_id, :body, :room_id)
  end

end