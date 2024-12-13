require "minitest_helper"

class TestHomepage < Bridgetown::Test
  def test_homepage
    html get "/"

    assert document.query_selector("body")
  end
end
