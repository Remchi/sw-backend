class SessionsController < Devise::SessionsController
  before_filter :authenticate_user_from_token!, only: [ :destroy ]
  
  def create
    # check credentials
    user = User.find_for_database_authentication(email: params[:email])
    if user && user.valid_password?(params[:password])
      token = user.ensure_authentication_token
      render json: {
        success: true,
        auth_token: token
      }
    else
      render nothing: true, status: 401
    end
  end

  def destroy
    current_user.authentication_token = ''
    current_user.save!
    render json: {}
  end

  
end
