import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["notification"];

  close(event) {
    const notification = event.target.closest(".notification");
    if (notification) {
      notification.remove();
    }
  }
}