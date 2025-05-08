import { createConsumer } from "@rails/actioncable";

const consumer = createConsumer();

document.addEventListener("turbo:load", () => {
  const chatRoomElement = document.getElementById("messages");
  const chatRoomId = chatRoomElement?.dataset.chatRoomId;

  if (chatRoomId) {
    consumer.subscriptions.create(
      { channel: "ChatMessagesChannel", chat_room_id: chatRoomId },
      {
        received(data) {
          const messagesContainer = document.getElementById("messages");
          if (!messagesContainer) {
            console.error("Messages container not found in the DOM.");
            return;
          }
          if (data.trim() !== "") {
            messagesContainer.insertAdjacentHTML("beforeend", data);
            messagesContainer.scrollTop = messagesContainer.scrollHeight; // Auto-scroll to the bottom
          }
        },
      }
    );
  }
});