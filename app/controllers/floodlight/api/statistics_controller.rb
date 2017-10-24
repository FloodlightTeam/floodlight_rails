module Floodlight
  class Api::StatisticsController < ApiController
    def show
      render json: { count: Floodlight.statistics_for(params[:id], days_ago: params[:days_ago] || 1) }
    end
  end
end