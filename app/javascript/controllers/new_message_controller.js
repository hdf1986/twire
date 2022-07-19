import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['text', 'submit']
  static classes = ['disabled', 'enabled']

  connect() {
    this.validateInput()
  }

  clearText(e) {
    this.textTarget.value = ''
  }

  validateInput () {
    const isValid = this.textTarget.value !== ''
    this.submitTarget.disabled = !isValid

    if(isValid) {
      this.submitTarget.classList.add(this.enabledClass)
      this.submitTarget.classList.remove(this.disabledClass)
    } else {
      this.submitTarget.classList.remove(this.enabledClass)
      this.submitTarget.classList.add(this.disabledClass)
    }
  }
}
