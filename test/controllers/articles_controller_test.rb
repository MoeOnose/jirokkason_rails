require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get articles_top_url
    assert_response :success
  end

  test "should get show" do
    get articles_show_url
    assert_response :success
  end

  test "should get answer" do
    get articles_answer_url
    assert_response :success
  end

  test "should get index" do
    get articles_index_url
    assert_response :success
  end

end
