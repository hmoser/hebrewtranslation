require 'test_helper'

class OriginalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @original = originals(:one)
  end

  test "should get index" do
    get originals_url
    assert_response :success
  end

  test "should get new" do
    get new_original_url
    assert_response :success
  end

  test "should create original" do
    assert_difference('Original.count') do
      post originals_url, params: { original: { assignment_id: @original.assignment_id, title: @original.title, upload: @original.upload } }
    end

    assert_redirected_to original_url(Original.last)
  end

  test "should show original" do
    get original_url(@original)
    assert_response :success
  end

  test "should get edit" do
    get edit_original_url(@original)
    assert_response :success
  end

  test "should update original" do
    patch original_url(@original), params: { original: { assignment_id: @original.assignment_id, title: @original.title, upload: @original.upload } }
    assert_redirected_to original_url(@original)
  end

  test "should destroy original" do
    assert_difference('Original.count', -1) do
      delete original_url(@original)
    end

    assert_redirected_to originals_url
  end
end
