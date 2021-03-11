class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, except: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]

  def index
    @purchase_form = PurchaseForm.new
    #  @item = Item.find(params[:item_id])　　　(理解したら削除)
    redirect_to root_path if current_user == @item.user
  end

  def create
    #  @item = Item.find(params[:item_id])  　　(理解したら削除)
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private


  def purchase_params
    params.require(:purchase_form).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  # 投稿者以外のユーザーが、編集等で、投稿者専用のページに遷移できないようにする
  def move_to_index
    redirect_to action: :index if current_user.id != @item.user.id
  end

  def sold_out_item
    #  @item = Item.find(params[:item_id])  　(理解したら削除) 
    redirect_to root_path if @item.purchase_history.present?
  end
end
