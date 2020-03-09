class GpsWaypointsController < ApplicationController
  def show; end

  def last_vehicles_location
    @vehicles = Vehicle.all.only_last_gps_waypoint
    render json: { status: :ok, vehicles: @vehicles }, state: :ok
  rescue StandardError => e
    render json: { status: :error, message: e.message }, state: :bad_request
  end
end