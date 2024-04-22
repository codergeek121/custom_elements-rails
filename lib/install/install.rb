add_file "app/javascript/custom_elements/index.js", <<~JS
  import { eagerDefineCustomElementsFrom } from "custom_elements-rails"

  eagerDefineCustomElementsFrom("custom_elements", { prefix: "app" })
JS

# add hello world element
add_file "app/javascript/custom_elements/hello_element.js", <<~JS
  export default class extends HTMLElement {
    constructor() {
      super()
    }

    connectedCallback() {
      console.log("hello world")
    }
  }
JS

# add import to application.js
append_to_file('app/javascript/application.js', 'import "custom_elements"')

# pin basic eager loading script
append_to_file('config/importmap.rb', <<~RUBY)
  pin "custom_elements-rails"
RUBY

# pin custom elements folder to importmap
append_to_file('config/importmap.rb', <<~RUBY)
  pin_all_from "app/javascript/custom_elements", under: "custom_elements"
RUBY
