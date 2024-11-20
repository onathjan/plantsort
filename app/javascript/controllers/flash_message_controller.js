import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["notification"];

  connect() {
    // Automatically close the notification after 5 seconds
    this.timeoutId = setTimeout(() => {
      this.closeNotification();
    }, 4000);
  }

  close() {
    // Cancel the auto-close timeout to prevent conflicts
    clearTimeout(this.timeoutId);

    // Close the notification when the close button is clicked
    this.closeNotification();
  }

  closeNotification() {
    if (this.hasNotificationTarget) {
      this.notificationTarget.remove();
    }
  }
}
