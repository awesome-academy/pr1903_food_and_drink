require 'test_helper'

class ConsumablesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get consumables_new_url
    assert_response :success
  end

end
