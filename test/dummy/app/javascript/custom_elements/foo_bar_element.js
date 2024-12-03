export default class extends HTMLElement {
  constructor() {
    super()
  }

  connectedCallback() {
    this.textContent = "connectedCallback(): foo_bar_element.js"
  }
}
