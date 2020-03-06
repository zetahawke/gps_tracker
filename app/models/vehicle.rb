require 'pry'

class Vehicle < ApplicationRecord
  has_many :gps_waypoints

  accepts_nested_attributes_for :gps_waypoints

  validates_presence_of :identifier

  class << self
    def safe_params
      %i[identifier]
    end

    def safe_nested_params
      %i[vehicle_identifier latitude longitude sent_at]
    end

    def save_waypoint(params)
      vehicle = find_or_create(params)
      vehicle.gps_waypoints.create!(params.permit(GpsWaypoint.safe_params))
      vehicle.serialize_response
    end

    def find_or_create(params)
      find_by(identifier: params[:vehicle_identifier]) || create!(identifier: params[:vehicle_identifier])
    end

    def only_last_gps_waypoint
      where('').map(&:with_last_gps_waypoint)
    end
  end

  def serialize_response
    {
      vehicle_identifier: identifier
    }.merge!(gps_waypoints.last.serializable_hash.slice(
      'latitude',
      'longitude',
      'sent_at'
    ))
  end

  def with_last_gps_waypoint
    serializable_hash.merge!(gps_waypoints.last.try(:serializable_hash))
  end
end
