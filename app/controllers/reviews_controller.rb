class ReviewsController < ApplicationController
  def create
    user = current_user
    itinerary = Itinerary.find_by_id(params[:itinerary_id])
    reviewable = nil

    if user and itinerary.guests.include? user
      if params.key? :waypoint_id
        reviewable = Waypoint.find_by_id(params[:waypoint_id])
      else
        reviewable = itinerary
      end
    end

    if reviewable
      review = reviewable.reviews.new review_params
      review.user = user
      if review.save
        flash[:success] = "Review added!"
      else
        flash[:alert] = "Review not saved"
      end
      if itinerary != reviewable
        redirect_to [itinerary, reviewable]
      else
        redirect_to itinerary
      end
    else
      flash[:alert] = "An error occured"
      redirect_to root_path
    end
  end

  private
  def review_params
    params.require(:review).permit(:content)
  end
end
