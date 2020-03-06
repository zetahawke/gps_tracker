require 'rails_helper'

stub_gps_waypoint = {
  "latitude": 20.23,
  "longitude": -0.56,
  "sent_at": "2016-06-02 20:45:00",
  "vehicle_identifier": "HA-3452"
}.with_indifferent_access

describe "post a gps waypoint route", type: :request do
  before do
    post '/api/v1/gps', params: stub_gps_waypoint
  end

  it "returns the gps waypoint's latitude" do
    expect(JSON.parse(response.body)['gps']['latitude'].to_s).to eq(stub_gps_waypoint['latitude'].to_s)
  end

  it "returns the gps waypoint's longitude" do
    expect(JSON.parse(response.body)['gps']['longitude'].to_s).to eq(stub_gps_waypoint['longitude'].to_s)
  end

  it "returns the gps waypoint's sent_at" do
    expect(JSON.parse(response.body)['gps']['sent_at'].to_datetime).to eq(stub_gps_waypoint['sent_at'].to_datetime)
  end

  it "returns the gps waypoint's vehicle_identifier" do
    expect(JSON.parse(response.body)['gps']['vehicle_identifier']).to eq(stub_gps_waypoint['vehicle_identifier'])
  end

  it "returns correct status code" do
    expect(response.code).to eq("200")
  end

  it "returns a created status" do
    expect(response).to have_http_status(:ok)
  end
end