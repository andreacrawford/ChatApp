App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".message").prepend(data.message);
  },

  listen_to_messages: function() {
    return this.perform('listen', {
      room_id: $("[data-room-id]").data("room-id")
    });
  }


// send_message: function(message, room_id) {
 //       return this.perform('send_message', {
  //        message: message,
 //         room_id: room_id
 //       });
  //    }

});

$(document).on("turbolinks:load ajaxSuccess", function() {
  App.room.listen_to_messages();
  //App.room.send_message();

});
