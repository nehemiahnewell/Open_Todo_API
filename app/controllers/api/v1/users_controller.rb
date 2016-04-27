class Api::V1::UsersController < ApiController
  before_action :authenticated?
 


  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end
 
  def show
    user = User.find(params[:id])
    render json: user
  end
  
  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
 
  def destroy
    user = User.find(params[:id])
 
    if user.destroy
      render json: {message: "User destroyed", status: 200}
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    user = User.find(params[:id])
 
    if user.update_attributes(user_params)
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end