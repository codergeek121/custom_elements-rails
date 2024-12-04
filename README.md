# Custom Elements Rails

[![Tests](https://github.com/codergeek121/custom_elements-rails/actions/workflows/ruby.yml/badge.svg?branch=main)](https://github.com/codergeek121/custom_elements-rails/actions/workflows/ruby.yml)

This gem adds a simple way to automatically register custom elements in your `importmap-rails` app. No build step required!

- Supports `importmap-rails` v1 and v2.
- Supports `rails` 7.0, 7.1 & 8.0.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "custom_elements-rails"
```

Install the gem:

```bash
$ bundle install
```

Run the initial setup:

```bash
$ rails custom_elements:install
```

This will setup and edit add the following files:

```
app/javascript
├── application.js
└── custom_elements
    ├── hello_element.js
    └── index.js
```

The `<app-hello>` custom element can be used in views now.

You can generate a new custom element `<app-demo>` with `rails generate custom_element demo`.

### How It Works

The `custom_elements-rails` gem uses `eagerDefineCustomElementsFrom` to automatically register [custom elements](https://developer.mozilla.org/en-US/docs/Web/API/Web_components/Using_custom_elements) from the `custom_elements` folder. It reads the importmap from `importmap-rails` and registers elements using `customElements.define(...)`.

For example:

```
custom_elements/hello_element.js // Automatically registers <app-hello>
```

> [!IMPORTANT]  
> Make sure your `*_element.js` files use `export default` to define the custom elements.

### Naming Convention for Custom Elements

When defining custom elements from files, their filenames are used to generate the element names automatically. The following rules and examples clarify how file paths are converted to custom element names:

#### Usage

Register all files in the `custom_elements` folder as custom elements:

```js
eagerDefineCustomElementsFrom("custom_elements", { prefix: "app" });
```

| Filepath                            | Generated Custom Element Name |
|-------------------------------------|--------------------------------|
| `custom_elements/demo_element.js`   | `<app-demo>`                  |
| `custom_elements/demo-element.js`   | `<app-demo>`                  |
| `custom_elements/foo_bar_element.js`| `<app-foo-bar>`               |
| `custom_elements/folder/foo_bar_element.js` | `<app-folder--foo-bar>` |

#### Conversion Rules

- Filenames are transformed into kebab-case (lowercase with hyphens).
- The folder structure is reflected in the name using double hyphens (`--`) to separate folder names from the file name.
- A [configurable prefix](#documentation) is added to the beginning of each custom element name.

## Add a custom element with the built-in generator

This gem adds a generator to generate new custom elements with:

```bash
$ rails generate custom_element test 
```

This will generate 

```javascript
// app/javascript/custom_elements/test_element.js
export default class extends HTMLElement {
  constructor() {
    super()
  }

  connectedCallback() {
    console.log("test_element.js")
  }
}
```

which in turn will register a `<app-test></app-test>` custom element automatically in your app.

```bash
$ rails generate custom_element test 
```

To observe changes in your custom element's attributes, you need to set a static array of attribute names. The generator also supports setting those automatically:

```bash
$ rails generate custom_element test attribute1
```

will generate

```javascript
export default class extends HTMLElement {
  static observedAttributes = ["attribute1"]

  constructor() {
    super()
  }

  connectedCallback() {
    console.log("test_element.js")
  }

  get attribute1() {
    return this.getAttribute("attribute1")
  }
}
```

## Documentation

`eagerDefineCustomElementsFrom(under, options)`

Currently supported optional `options`:

* `prefix`: The custom elements namespace. (default: "app")

## Contributing

TODO

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
