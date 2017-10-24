module Floodlight
  class Api::MetricsController < ApiController
    def index
      render json: { metrics: Floodlight.metrics.map { |m| [m.name, m.type]} }
    end
  end
end