import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = [ "modal" ]
  connect() {
    console.log("Modal is in the House!")
  }
  open() {
    
    this.modalTarget.style.display = "block"
  }

  close() {
    this.modalTarget.style.display = "none"
  }
}
