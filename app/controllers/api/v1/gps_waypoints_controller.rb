module Api
  module V1
    class GpsWaypointsController < ApplicationController
      def insert_gps_waypoint
        render json: { status: :ok,  gps: Vehicle.save_waypoint(gps_params)}, state: :ok
      rescue ActiveResource::ResourceInvalid => e
        render json: { status: :error, message: e.message }, state: :unprocessable_entity
      rescue StandardError => e
        render json: { status: :error, message: e.message }, state: :bad_request
      end
      
      private

      def gps_params
        params.permit(Vehicle.safe_nested_params)
      end
    end
  end
end