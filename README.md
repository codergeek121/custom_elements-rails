# Custom Elements with Rails

This gem provides a small js-helper, installation and generators to use custom elements in conjunction with `importmap-rails`.

## Usage

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

This will setup and add the following files:

```
app/javascript
├── application.js
└── custom_elements
    ├── hello_element.js
    └── index.js
```

You can now add the `<app-hello>` custom element in your HTML. No build step needed.

## How it works

`eagerDefineCustomElementsFrom("custom_elements", { prefix: "app" })` will parse the JSON-importmap rendered by the `importmap-rails` gem and register custom elements with `customElements.define(...)` to the browser's custom element registry.

```
custom_elements/hello_element.js // will register <app-hello>
```

Your `_element.js` files have to `export default` custom elements for this to work.

> [!WARNING]  
> Only single word elements are support currently.


## Add a custom element

Generate a new custom element with:

```bash
$ rails generate custom_element test 
```

This will generate 

```
app/javascript
└── custom_elements
    └── test_element.js
```

which in turn will register a `<app-test></app-test>` custom element.

## Contributing

TODO

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
