class Vehicle < ApplicationRecord
  has_many :gps_waypoints

  accepts_nested_attributes_for :gps_waypoints

  validates_presence_of :identifier

  class << self
    def safe_params
      %i[identifier]
    end

    def safe_nested_params
      %i[identifier latitude longitude sent_at]
    end

    def save_waypoint(params)
      vehicle = Vehicle.find_by(identifier: params[:vehicle_identifier])
      if vehicle.present?
        vehicle.gps_waypoints.create(params.slice(GpsWaypoint.safe_params))
      else
        vehicle.create!(params)
      end
    end
  end
end
