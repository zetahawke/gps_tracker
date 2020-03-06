require 'rails_helper'

RSpec.describe GpsWaypoint, :type => :model do
  subject {
    described_class.new(
      latitude: '-32.13221',
      longitude: '70.231231',
      sent_at: DateTime.current,
      vehicle_id: Vehicle.create(identifier: 'test').id
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a latitude" do
    subject.latitude = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a longitude" do
    subject.longitude = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a sent_at" do
    subject.sent_at = nil
    expect(subject).to_not be_valid
  end
end