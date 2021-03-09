class OrdersController < ApplicationController
  
  def index
    @purchase_form = PurchaseForm.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  
  end


  private

  def purchase_params
      params.require(:purchase_form).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number, ).merge(user_id: current_user.id, item_id: @item.id)
  end

end
