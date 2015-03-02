class WaypointsController < ApplicationController
  def show
    @user = current_user
    @itinerary = get_itinerary
    @waypoint = get_waypoint(@itinerary)
    if not is_guest(@itinerary, @user)
      redirect_to root_path
    elsif not @waypoint
      redirect_to @itinerary
    end
    @is_traveling = is_traveler(@waypoint, @user)
  end

  def new
    @itinerary = get_itinerary
    unless is_guest(@itinerary, current_user)
      redirect_to @itinerary
    end
  end

  def edit
    user = current_user
    @itinerary = get_itinerary
    @waypoint = get_waypoint(@itinerary)
    unless is_guest(@itinerary, user) and @waypoint
      redirect_to @itinerary
    end
  end

  def create
    user = current_user
    itinerary = get_itinerary
    if is_guest(itinerary, user)
      waypoint = Waypoint.new waypoint_params
      waypoint.itinerary = itinerary
      if waypoint.save
        flash[:success] = "Waypoint (#{waypoint.name}) added!"
      else
        flash[:alert] = "Waypoint (#{waypoint.name}) not added"
      end
      redirect_to itinerary
    else
      flash[:alert] = "You don't have permission to add to that itinerary"
      redirect_to root_path
    end
  end

  def update
    user = current_user
    itinerary = get_itinerary
    if is_guest(itinerary, user)
      waypoint = get_waypoint(itinerary)
      if waypoint.update(waypoint_params)
        flash[:success] = "Waypoint (#{waypoint.name}) updated"
      else
        flash[:alert] = "Waypoint (#{waypoint.name}) not updated"
      end
      redirect_to itinerary
    else
      flash[:alert] = "You don't have permission to edit that itinerary"
      redirect_to root_path
    end
  end

  def add_traveler
    user = current_user
    itinerary = get_itinerary
    waypoint = get_waypoint itinerary
    if is_me(user) and is_guest(itinerary, user) and not is_traveler(waypoint, user)
      flash[:success] = "Added #{user.full_name} to #{waypoint.name}"
      waypoint.users << user
    else
      flash[:warning] = "Traveler not add to waypoint"
    end
    redirect_to [itinerary, waypoint]
  end

  def remove_traveler
    user = current_user
    itinerary = get_itinerary
    waypoint = get_waypoint itinerary
    if is_me(user) and is_traveler(waypoint, user)
      flash[:success] = "Removed #{user.full_name} from #{waypoint.name}"
      waypoint.users.delete(user)
    else
      flash[:alert] = "Error removing traveler from waypoint"
    end
    redirect_to [itinerary, waypoint]
  end

  private
  def waypoint_params
    params.require(:waypoint).permit(:name, :date)
  end
  def get_itinerary
    Itinerary.find_by_id(params[:itinerary_id])
  end
  def get_waypoint itinerary
    itinerary.waypoints.find_by_id(params[:id])
  end
  def is_guest itinerary, user
    itinerary and user and itinerary.guests.include? user
  end
  def is_traveler waypoint, user
    waypoint and user and waypoint.users.include? user
  end
  def is_me user
    user.id == params[:traveler_id].to_i
  end
end
