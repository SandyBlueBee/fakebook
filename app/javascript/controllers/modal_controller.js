import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["chatrooms", "modal"]
  // static classes = ["hidden"];

  connect() {
    console.log("Modal is in the House!")
    this.conversationIds = []
  }

  toggle(event) {
    const userId = event.currentTarget.dataset.userId
    // "https://localhost:3000/chatrooms?user_id=1"
    // console.log(url);
    // console.log(userId)  
    if (this.conversationIds.includes(userId)) {
      // remove the user from the list of users in the chatroom
      this.conversationIds.splice(this.conversationIds.indexOf(userId), 1);
      // console.log("remove");
      // console.log(userId);
      // console.log(this.modalTargets);
      const modal = document.querySelectorAll(`[data-user-id="${userId}"]`)[1];
      console.log(modal);
      modal.remove();

    }else {
      // console.log("Open modal");
      const url = new URL(window.location.href);
      url.pathname = "/chatrooms"
      url.searchParams.set("user_id", userId);
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
          // console.log(data);
          this.chatroomsTarget.insertAdjacentHTML("beforeend", data.partial)

        })
    }
  }
}
