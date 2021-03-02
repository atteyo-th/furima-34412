class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
  end
end

private

def message_params
  params.require(:item).permit(:name, :description, :price, :status_id, :cost_id, :delivery_id, :category_id, :user ).merge(user_id: current_user.id)
end