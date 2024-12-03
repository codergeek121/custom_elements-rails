require "system_helper"

class CustomElements::IntegrationTest < ApplicationSystemTestCase
  test "hello_element.js connects" do
    visit elements_path

    assert_text "connectedCallback(): hello_element.js"
  end

  test "foo_bar_element.js connects" do
    visit elements_path

    assert_text "connectedCallback(): foo_bar_element.js"
  end

  test "some-name-element.js connects" do
    visit elements_path

    assert_text "connectedCallback(): some-name-element.js"
  end

  test "namespace/demo_element.js connects" do
    visit elements_path

    assert_text "connectedCallback(): demo_element.js"
  end
end
