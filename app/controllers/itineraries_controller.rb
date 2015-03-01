class ItinerariesController < ApplicationController
  def show
    user = current_user
    @itinerary = Itinerary.find(params[:id])
    @admin = is_admin(@itinerary, user)
    unless @admin or @itinerary.guests.include? user
      redirect_to root_path
    end
    if @admin
      @invitable = User.all - @itinerary.guests
    end
  end

  def edit
  end

  def new
    if is_logged_in
      @itinerary = Itinerary.new
    else
      redirect_to root_path
    end
  end

  def create
    user = current_user
    if user
      itinerary = Itinerary.new itinerary_params
      itinerary.user = user    # set user as owner
      itinerary.guests << user # also make user a traveler
      if itinerary.save
        flash[:success] = "Itinerary created!"
        redirect_to itinerary
      else
        flash[:alert] = "Something went wrong"
        redirect_to :new
      end
    else
      redirect_to root_path
    end
  end

  def add_guest
    itinerary = Itinerary.find_by_id(params[:id])
    if is_admin(itinerary, current_user)
      guest = User.find_by_id(params[:guest_id])
      unless itinerary.guests.include? guest
        itinerary.guests << guest
      end
    end
    redirect_to itinerary
  end

  def remove_guest
    itinerary = Itinerary.find_by_id(params[:id])
    if is_admin(itinerary, current_user)
      guest = User.find_by_id(params[:guest_id])
      if guest
        itinerary.guests.delete(guest)
      end
    end
    redirect_to itinerary
  end

  def destroy
    itinerary = Itinerary.find_by_id(params[:id])
    if is_admin(itinerary, current_user)
      itinerary.destroy
    end
    redirect_to root_path
  end

  private
  def itinerary_params
    params.require(:itinerary).permit(:name)
  end
  def is_admin itinerary, user
    itinerary and user == itinerary.user
  end
end
