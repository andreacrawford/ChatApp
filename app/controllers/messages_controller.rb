class MessagesController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.user = current_user


    if @message.save
      #do somehting
    else
      redirect_to rooms_path
    end
  end

private

  def message_params
    params.require(:message).permit(:user_id, :body, :room_id)
  end

end