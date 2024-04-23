export default class extends HTMLElement {
  constructor() {
    super()
  }

  connectedCallback() {
    this.textContent = "connectedCallback(): hello_element.js"
  }
}
