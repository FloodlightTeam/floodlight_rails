module Meerstats
  class Api::StatisticsController < ApiController
    def show
      render json: { count: Meerstats.statistics_for(params[:id], days_ago: params[:days_ago] || 1) }
    end
  end
end