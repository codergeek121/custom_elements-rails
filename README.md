# Custom Elements with Rails

This gem provides a small helper and installation scripts to use custom elements in conjunction with `importmap-rails`.

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

You can now add the `<app-hello>` custom element in your app. No build step needed.

## Add a custom element

TODO

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
