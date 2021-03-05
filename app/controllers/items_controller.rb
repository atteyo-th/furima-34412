class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    # unless@item.user_id == current_user.id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  # ストロングパラメーター(updateアクションにて params を指定)
  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :status_id, :cost_id, :area_id, :delivery_id, :category_id,
                                 :user).merge(user_id: current_user.id)
  end

  # 投稿者以外のユーザーが、編集等で、投稿者専用のページに遷移できないようにする
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
