class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]

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
    # @item = Item.find(params[:id])　　(理解したら削除)
  end

  def edit
    # @item = Item.find(params[:id])　　(理解したら削除)
  end

  def update
    # @item = Item.find(params[:id])   (理解したら削除)
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    # @item = Item.find(params[:id])   (理解したら削除)
    @item.destroy
    redirect_to root_path
  end

  private

  # ストロングパラメーター(updateアクションにて params を指定)
  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :status_id, :cost_id, :area_id, :delivery_id, :category_id,
                                 :user).merge(user_id: current_user.id)
  end

  # show,edit,update のインスタンス変数が同じなので一つにまとめている
  def set_item
    @item = Item.find(params[:id])
  end

  # 投稿者以外のユーザーが、編集等で、投稿者専用のページに遷移できないようにする
  def move_to_index
    redirect_to action: :index if current_user.id != @item.user.id || @item.purchase_history.present?
  end
end
