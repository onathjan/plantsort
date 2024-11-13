import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"];

  toggleMenu() {
    const burger = this.element.querySelector(".navbar-burger");
    const menu = this.menuTarget;

    burger.classList.toggle("is-active");
    menu.classList.toggle("is-active");
  }
}