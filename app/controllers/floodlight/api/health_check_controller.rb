module Floodlight
  class Api::HealthCheckController < Floodlight::ApiController
    def index
      render json: { success: true }
    end
  end
end
