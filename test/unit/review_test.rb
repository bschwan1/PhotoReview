require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test "no save without reviewer body" do
    review = Review.new
    assert !review.save
  end
  test "should not save with reviewer less three chars" do
    review = Review.new
    review.reviewer = "WN"
    review.body = "This is the body of the review."
    assert !review.save
  end
  test "should not save with nil body" do
    review = Review.new
    review.reviewer = "WNS"
    review.body = nil
    assert !review.save
  end
  test "should save reviewer with reviewer body" do
    review = Review.new
    review.reviewer = "WNS"
    review.body = "This is the body of the review."
    assert review.save
  end

end
