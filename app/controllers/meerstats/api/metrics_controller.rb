module Meerstats
  class Api::MetricsController < ApiController
    def index
      render json: { metrics: Meerstats.metrics.map { |m| [m.name, m.type]} }
    end
  end
end