class GpsWaypoint < ApplicationRecord
  belongs_to :vehicle

  delegate :identifier, to: :vehicle, prefix: true

  class << self
    def safe_params
      %i[latitude longitude sent_at vehicle_identifier]
    end
  end
end
