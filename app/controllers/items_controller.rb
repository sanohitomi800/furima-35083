class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create 
    # binding.pry
    @item = Item.new(item_params)
  if @item.save
     redirect_to root_path
  else
     render :new
    end
  end

  private
 
  def item_params
    params.require(:item).permit(:content, :image ).merge(user_id: current_user.id)
    params.require(:item).permit(:name, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :days_id, :price)
  end
end
