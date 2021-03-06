class GpsWaypoint < ApplicationRecord
  belongs_to :vehicle

  validates_presence_of :latitude, :longitude, :sent_at

  delegate :identifier, to: :vehicle, prefix: true

  class << self
    def safe_params
      %i[latitude longitude sent_at]
    end
  end

  def serialized_data
    serializable_hash(only: self.class.safe_params)
  end
end
