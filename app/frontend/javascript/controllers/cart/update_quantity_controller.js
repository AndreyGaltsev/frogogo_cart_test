import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["quantity"]

    decrement(event) {
        const input = this.quantityTarget
        if (input.value > 1) {
            input.value = parseInt(input.value) - 1
            input.form.requestSubmit()
        }
    }

    increment(event) {
        const input = this.quantityTarget
        input.value = parseInt(input.value) + 1
        input.form.requestSubmit()
    }

    submit() {
        this.element.requestSubmit();
    }
}