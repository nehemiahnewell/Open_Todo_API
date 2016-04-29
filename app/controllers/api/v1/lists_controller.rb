class Api::V1::ListsController < ApiController
  before_action :authenticated?
 
  def index
    lists = List.all
    render json: lists, each_serializer: ListSerializer
  end
 
  def show
    list = List.find(params[:id])
    render json: list
  end
  
  def create
    list = List.new(list_params)
    user = User.find(params[:user_id])
    list.user = user
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end
 
  def destroy
    begin
      user = User.find(params[:user_id])
      list = user.lists.find(params[:id])
      list.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end
  
  def update
  
    user = User.find(params[:user_id])
    list = user.lists.find(params[:id])
    if list.update_attributes(list_params)
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  private
  
  def list_params
    params.require(:list).permit(:name, :permissions, :user)
  end
end