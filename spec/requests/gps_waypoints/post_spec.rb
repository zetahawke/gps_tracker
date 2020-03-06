require 'rails_helper'

stub_gps_waypoint = {
  "latitude": 20.23,
  "longitude": -0.56,
  "sent_at": "2016-06-02 20:45:00",
  "vehicle_identifier": "HA-3452"
}

describe "post a gps waypoint route", type: :request do
  before do
    post '/api/v1/gps', params: stub_gps_waypoint
  end

  it "returns the gps waypoint's latitude" do
    expect(JSON.parse(response.body)['gps_waypoint']['latitude']).to eq(stub_gps_waypoint['latitude'])
  end

  it "returns the gps waypoint's longitude" do
    expect(JSON.parse(response.body)['gps_waypoint']['longitude']).to eq(stub_gps_waypoint['longitude'])
  end

  it "returns the gps waypoint's sent_at" do
    expect(JSON.parse(response.body)['gps_waypoint']['sent_at']).to eq(stub_gps_waypoint['sent_at'])
  end

  it "returns the gps waypoint's vehicle_identifier" do
    expect(JSON.parse(response.body)['gps_waypoint']['vehicle_identifier']).to eq(stub_gps_waypoint['vehicle_identifier'])
  end

  it "returns the question's number" do
    expect(response.code).to eq(200)
  end

  it "returns a created status" do
    expect(response).to have_http_status(:created)
  end
end