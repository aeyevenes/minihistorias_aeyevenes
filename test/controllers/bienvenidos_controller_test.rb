require "test_helper"

class BienvenidosControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get bienvenidos_hello_url
    assert_response :success
  end
end
