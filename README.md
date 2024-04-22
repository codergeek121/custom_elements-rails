# Custom Elements with Rails

This gem provides a small js-helper, installation scripts and generators to use custom elements in conjunction with the `importmap-rails` gem.

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

This will setup and edit add the following files:

```
app/javascript
├── application.js
└── custom_elements
    ├── hello_element.js
    └── index.js
```

You can now add the `<app-hello>` custom element in your HTML. No build step needed.

## How it works

`eagerDefineCustomElementsFrom` will parse the JSON-importmap rendered by the `importmap-rails` gem.
It registers custom elements with `customElements.define(...)` in the browser's registry based on the filename automatically.

```
custom_elements/hello_element.js // will register <app-hello>
```

Your `*_element.js` files have to `export default` custom elements for this to work properly.

> [!WARNING]  
> Only single word elements are supported currently. See https://github.com/codergeek121/custom_elements-rails/issues/1


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
