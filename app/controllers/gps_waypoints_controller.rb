class GpsWaypointsController < ApplicationController
  def show
    @vehicles = Vehicle.all.only_last_gps_waypoint
  end
end