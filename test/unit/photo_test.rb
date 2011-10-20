require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test "should not save without Title Filename and Content Type" do
    photo = Photo.new
    assert !photo.save
  end
  test "should not save with title less than six chars" do
    photo = Photo.new
    photo.title = "Title"
    photo.filename = "testFile.jpg"
    photo.content_type = "image/jpeg"
    assert !photo.save
  end
  test "should not save non jpeg file" do
    photo = Photo.new
    photo.title = "Title One"
    photo.filename = "testFile.gif"
    photo.content_type = "image/gif"
    assert !photo.save
  end
  test "should save this photo with Title One" do
    photo = Photo.new
    photo.title = "Title One"
    photo.filename = "testFile.jpg"
    photo.content_type = "image/jpeg"
    assert photo.save
  end
end
