class ReviewsController < ApplicationController

  http_basic_authenticate_with :name => "instructor", :password => "secret", :only => :destroy

  def create
    @photo = Photo.find(params[:photo_id])
    @review = @photo.reviews.create(params[:review])
    redirect_to photo_path(@photo)
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @review = @photo.reviews.find(params[:id])
    @review.destroy
    redirect_to photo_path(@photo)
  end

end
