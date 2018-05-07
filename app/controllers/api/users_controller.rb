class Api::UsersController < ApiController
  skip_before_action :authenticate_request, only: [:create]

  def me
    json_response(current_user)
  end

  def index
    users = User.all
    json_response(users)
  end

  def show
    user = User.find(params[:id])
    json_response(user)
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def update
    current_user.update(user_params)
    head :no_content
  end

  private

  def user_params
    params.permit :username, :email, :password
  end

end
