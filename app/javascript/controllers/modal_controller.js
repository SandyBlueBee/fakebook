import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["chatrooms", "modal"]
  // static classes = ["hidden"];

  connect() {
    // console.log("Modal is in the House!")
    this.conversationIds = []
  }

  toggle(event) {
    const userId = event.currentTarget.dataset.userId
    if (this.conversationIds.includes(userId)) {
      // remove the user from the list of users in the chatroom
      this.conversationIds.splice(this.conversationIds.indexOf(userId), 1);
      const modal = document.querySelectorAll(`[data-user-id="${userId}"]`)[1];
      modal.remove();

    }else {
      const url = new URL(window.location.href);
      url.pathname = "/chatrooms"
      url.searchParams.set("user_id", userId);
      // console.log(url);
      // "https://localhost:3000/chatrooms?user_id=1"
      this.conversationIds.push(userId);
      fetch(url, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json"
        }
      })
        .then(response => response.json())
        .then(data => {
          this.chatroomsTarget.insertAdjacentHTML("beforeend", data.partial)
        })
    }
    this.read(event);
    this.resetNotificationCount(userId);
  }

  read(event) {
    const url = new URL(window.location.href);
    url.pathname = `/mark_notifications_as_read`
    // console.log(url);
    // "https://localhost:3000/mark_notifications_as_read"
    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
      }
    })
    .catch(error => {
      console.error("Fetch Error:", error);
    });
  }

  resetNotificationCount(userId) {
    const notificationElement = document.querySelector(`[data-user-id="${userId}"] .notification-count`);
    if (notificationElement) {
      notificationElement.textContent = '0';
      notificationElement.classList.remove('notification-count');
    }
  }
}
