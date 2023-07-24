import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="posts"
export default class extends Controller {
  static targets = ["commentshow", "commentform", "postEdit"]
  connect() {
    console.log("Stimulus post is in the House!")
  }

  commentShow() {
    // console.log("show comments")
    this.commentshowTarget.classList.toggle("visible");
    this.commentformTarget.classList.toggle("visible");
  }

  commentNew() {
    this.commentformTarget.classList.toggle("visible");
  }

  // edit(event) {
  //   event.preventDefault();
  //   this.postEditTarget.classList.remove("hidden");
  // }

}
