class Api::V1::UsersController < ApiController
  before_action :authenticated?
 
  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end
 
  def show
  end
  
  def create
  end
 
  def destroy
  end
  
  def update
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end