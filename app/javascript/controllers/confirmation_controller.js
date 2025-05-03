import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  confirm(event) {
    const message = this.element.dataset.turboConfirm || "¿Estás seguro?"
    if (!confirm(message)) {
      event.preventDefault()
      event.stopImmediatePropagation()
    }
  }
}