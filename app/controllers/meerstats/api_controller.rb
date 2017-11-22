module Meerstats
  class ApiController < ActionController::Base
    before_action :verify_access_token

    def verify_access_token
      if params[:access_token] != Meerstats.configuration.access_token
        render json: { error: 'not authorized' }, status: 401
        return
      end
    end
  end
end
