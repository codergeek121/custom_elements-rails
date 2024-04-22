require "system_helper"

class CustomElements::IntegrationTest < ApplicationSystemTestCase
  test "hello_element.js connects" do
    visit elements_path

    assert_text "connectedCallback(): hello_element.js"
  end
end
