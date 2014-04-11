module Api
  class UsersController < ApplicationController
    before_filter :authenticate_user_from_token!
    
    def index
      if current_user
        render nothing: true
      else
        render json: {}, status: 401
      end
    end
  end
end
