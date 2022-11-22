import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"
// Connects to data-controller="banner"
export default class extends Controller {
  connect()  {
    new Typed(this.element, {
      strings: ["bike", "e-bike", "cargo bike", "overboard", "scooter", "e-scooter", "e-unicycle"],
      typeSpeed: 50,
      loop: true
    })
  }
}
