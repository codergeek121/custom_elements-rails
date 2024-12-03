export default class extends HTMLElement {
  constructor() {
    super()
  }

  connectedCallback() {
    this.textContent = "connectedCallback(): some-name-element.js"
  }
}
