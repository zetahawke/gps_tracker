require 'rails_helper'

RSpec.describe Vehicle, :type => :model do
  it "is valid with valid attributes" do
    expect(Vehicle.new).to be_valid
  end

  it "is not valid without a identifier" do
    vehicle = Vehicle.new(identifier: nil)
    expect(vehicle).to_not be_valid
  end
end