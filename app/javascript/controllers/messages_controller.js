import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messages"
export default class extends Controller {
  static targets = ["chatroom"];
  connect() {
    console.log("Stimulus messages is in the House!");
    console.log(this.chatroomTarget);
  }

  changeChatroom(event) {
    event.preventDefault();

    const chatroomId = event.currentTarget.dataset.chatroomId;
    this.updateMainChatroom(chatroomId);
  }

  updateMainChatroom(chatroomId){
    const url = `${window.location.href}?id=${chatroomId}`;
    console.log(url);
    fetch(url, {
          method: "GET",
          headers: {
            Accept: "text/plain"
      }
    })
    .then(response => response.text())
    .then(data => {
      console.log(data)
      this.chatroomTarget.innerHTML = data
    });
  }
}

// fetch(url, {
//       method: "POST",
//       headers: {
//         "Content-Type": "application/json",
//         Accept: "application/json",
//         "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
//       }
//     })
//     .catch(error => {
//       console.error("Fetch Error:", error);
//     });
