import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    this.timeout = setTimeout(() => this.dismiss(), 5000)
  }

  disconnect() {
    clearTimeout(this.timeout)
  }

  dismiss() {
    this.element.style.transition = "opacity .25s ease, transform .25s ease"
    this.element.style.opacity = "0"
    this.element.style.transform = "translateY(-6px)"
    setTimeout(() => this.element.remove(), 250)
  }
}
