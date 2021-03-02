class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

end

private

def item_params
  params.require(:item).permit(:name, :description, :price, :status_id, :cost_id, :area_id, :delivery_id, :category_id, :user ).merge(user_id: current_user.id)
end