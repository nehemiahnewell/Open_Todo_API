class Api::V1::ItemsController < ApiController
  before_action :authenticated?
 


  # def index
  #   items = Item.all
  #   render json: items, each_serializer: ItemSerializer
  # end
 
  # def show
  #   item = Item.find(params[:id])
  #   render json: item
  # end
  
  def create
    item = Item.new(item_params)
    list = List.find(params[:list_id])
    item.list = list
    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end
 
  def destroy
    begin
      item = Item.find(params[:id])
      item.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end
  
  def update
    item = Item.find(params[:id])
    if item.update_attributes(item_params)
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:description, :list, :completed)
  end
end