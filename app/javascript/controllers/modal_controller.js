import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["chatrooms"]
  connect() {
    console.log("Modal is in the House!")
  }

  open(event) {
    console.log("Open modal");
    const userId = event.currentTarget.dataset.userId
    const url = new URL(window.location.href);
    url.pathname = "/chatrooms"
    url.searchParams.set("user_id", userId);
    // "https://localhost:3000/chatrooms?user_id=1"
    console.log(url);
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
}
