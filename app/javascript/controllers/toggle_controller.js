import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "cardBootstrap", "cardSimpleForm", "buttonSwap", "buttonGroup" ]

  connect() {
    if (this.element.dataset.path.startsWith("/examples/")) {
      this.buttonSwapTarget.classList.remove("d-none");
      this.buttonGroupTarget.classList.remove("d-none");
    }

    // stack view for inline forms
    if (this.element.dataset.path == "/examples/inline") {
      this.buttonGroupTarget.querySelector("label").click()
    }
  }

  swapCard(event) {
    this.cardSimpleFormTarget.classList.toggle("order-first");
  }

  stackCard(event) {
    if (!event.target.previousElementSibling.checked) {
      this.cardBootstrapTarget.classList.toggle("col-md-12");
      this.cardSimpleFormTarget.classList.toggle("col-md-12");
    }
  }

  splitCard(event) {
    if (!event.target.previousElementSibling.checked) {
      this.cardBootstrapTarget.classList.toggle("col-md-12");
      this.cardSimpleFormTarget.classList.toggle("col-md-12");
    }
  }
}
