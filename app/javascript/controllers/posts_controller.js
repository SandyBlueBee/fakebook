import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="posts"
export default class extends Controller {
  static targets = ["commentshow", "commentform"]
  connect() {
    console.log("Stimulus post is in the House!")
  }

  commentShow() {
    // console.log("show comments")
    this.commentshowTarget.classList.toggle("visible");
    this.commentformTarget.classList.toggle("visible");
  }

  commentNew() {
    console.log(this.commentformTarget)
      this.commentshowTarget.classList.toggle("visible");
      this.commentformTarget.classList.toggle("visible");

  }
}
