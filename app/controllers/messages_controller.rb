class MessagesController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)

    respond_to do |format|
      if @message.save!
        #ActionCable.server.broadcast 'room_channel', message: @message.body, user: @message.user.first_name
        RoomChannel.broadcast_to(@room.id, message: MessagesController.render(partial:'messages/message', locals: {message: @message }))
        format.html { redirect_to @room }
        format.json { render :show, status: :created, location: @room }
        format.js
      else
        format.html { redirect_to rooms_path, alert: "Message error" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def message_params
    params.require(:message).permit(:user_id, :body)
  end

end