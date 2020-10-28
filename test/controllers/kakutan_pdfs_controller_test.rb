require 'test_helper'

class KakutanPdfsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kakutan_pdfs_index_url
    assert_response :success
  end

end
