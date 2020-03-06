require 'rails_helper'

RSpec.describe GpsWaypoint, :type => :model do
  before do
    vehicle = Vehicle.create(identifier: 'test')
    @gps_waypoint = GpsWaypoint.new(
      latitude: '-32.13221',
      longitude: '70.231231',
      sent_at: DateTime.current,
      vehicle_id: vehicle.i
    )
  end
  it "is valid with valid attributes" do
    expect(@gps_waypoint).to be_valid
  end

  it "is not valid without a latitude" do
    @gps_waypoint.latitude = nil
    expect(@gps_waypoint).to_not be_valid
  end

  it "is not valid without a longitude" do
    @gps_waypoint.longitude = nil
    expect(@gps_waypoint).to_not be_valid
  end

  it "is not valid without a sent_at" do
    @gps_waypoint.sent_at = nil
    expect(@gps_waypoint).to_not be_valid
  end
end