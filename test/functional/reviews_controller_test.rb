require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase

  fixtures :all

  # called before every test
  def setup
    @photo = photos(:one)
    @review = reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "should show review" do
    get :show, :id => @review.to_param
    assert_response :success
  end

  test "should only destroy review with correct security" do
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('student','secret')
    assert_no_difference('Review.count') do
      delete :destroy, :photo_id => @photo.to_param, :id => @review.to_param
    end
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('instructor','secret')
    assert_difference('Review.count', -1) do
      delete :destroy, :photo_id => @photo.to_param, :id => @review.to_param
    end
    assert_redirected_to @photo
  end

end
