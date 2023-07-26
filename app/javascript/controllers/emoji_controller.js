import { Controller } from "@hotwired/stimulus"
import { EmojiPickerElement } from 'unicode-emoji-picker';
// Connects to data-controller="emoji"
export default class extends Controller {
  static targets = ["emoji", "input"]
  connect() {
    // console.log("Emoji is in the House!");
  }
    add(event) {
        event.preventDefault();
        console.log(event);
        console.log("l'emoji", event.detail.emoji);
        // insert text in carret position
        let start_position = this.inputTarget.selectionStart;
        let end_position = this.inputTarget.selectionEnd;
        this.inputTarget.value = this.inputTarget.value.substring(0, start_position) + event.detail.emoji + this.inputTarget.value.substring(end_position);
        // add the emoji to the input and hide the picker
        this.emojiTarget.classList.add("hidden");

        console.log("le form",this.inputTarget);
        console.log("la valeur de l'input",this.inputTarget.value);

    }

    togglePicker() {
      this.emojiTarget.classList.toggle("hidden");
    }
  }
