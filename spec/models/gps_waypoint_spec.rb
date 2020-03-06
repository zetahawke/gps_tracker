require 'rails_helper'

RSpec.describe GpsWaypoint, :type => :model do
  it "is valid with valid attributes" do
    expect(GpsWaypoint.new).to be_valid
  end

  it "is not valid without a latitude" do
    gps_waypoint = GpsWaypoint.new(latitude: nil)
    expect(gps_waypoint).to_not be_valid
  end

  it "is not valid without a longitude" do
    gps_waypoint = GpsWaypoint.new(longitude: nil)
    expect(gps_waypoint).to_not be_valid
  end

  it "is not valid without a sent_at" do
    gps_waypoint = GpsWaypoint.new(sent_at: nil)
    expect(gps_waypoint).to_not be_valid
  end
end