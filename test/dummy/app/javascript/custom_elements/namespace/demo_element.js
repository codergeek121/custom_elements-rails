export default class extends HTMLElement {
  constructor() {
    super()
  }

  connectedCallback() {
    this.textContent = "connectedCallback(): demo_element.js"
  }
}
