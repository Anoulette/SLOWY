import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "date" ]
  static values = {
    dates: Array
  }
  connect() {
    console.log(this.datesValue)
    flatpickr(this.dateTarget, {
      minDate: "today",
      disable: this.datesValue,
      dateFormat: "Y-m-d",
    })
  }
}
