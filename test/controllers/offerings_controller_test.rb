require "test_helper"

class OfferingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get offerings_index_url
    assert_response :success
  end

  test "should get show" do
    get offerings_show_url
    assert_response :success
  end

  test "should get new" do
    get offerings_new_url
    assert_response :success
  end

  test "should get create" do
    get offerings_create_url
    assert_response :success
  end

  test "should get edit" do
    get offerings_edit_url
    assert_response :success
  end

  test "should get update" do
    get offerings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get offerings_destroy_url
    assert_response :success
  end
end
