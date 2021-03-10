class OrdersController < ApplicationController
  
  def index
    @purchase_form = PurchaseForm.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    # binding.pry
    @item = Item.find(params[:item_id])
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
      params.require(:purchase_form).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number, ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
