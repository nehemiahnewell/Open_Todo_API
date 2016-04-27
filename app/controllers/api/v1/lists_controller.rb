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
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end
 
  def destroy
   list = List.find(params[:id])
    if list.destroy
      render json: {message: "List destroyed", status: 200}
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    list = List.find(params[:id])
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