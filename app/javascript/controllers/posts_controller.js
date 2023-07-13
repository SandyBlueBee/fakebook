import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="posts"
export default class extends Controller {
  static targets = ["commentshow", "commentform"]
  connect() {
    console.log("Stimulus post is in the House!")
  }

  commentShow() {
    // console.log("show comments")
    if (this.commentshowTarget.style.display === "none") {
      this.commentshowTarget.style.display = "flex";
      this.commentformTarget.style.display = "flex";
    } else {
      this.commentshowTarget.style.display = "none";
      this.commentformTarget.style.display = "none";
    }
  }

  commentNew() {
    console.log(this.commentformTarget)
      this.commentshowTarget.classList.toggle("visible");
      this.commentformTarget.classList.toggle("visible");

  }
}
