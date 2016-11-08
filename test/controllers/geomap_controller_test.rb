require 'test_helper'

class GeomapControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get geomap_index_url
    assert_response :success
  end

end
