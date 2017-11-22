module Meerstats
  class Api::HealthCheckController < Meerstats::ApiController
    def index
      render json: { success: true }
    end
  end
end
