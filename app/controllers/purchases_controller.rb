class PurchasesController < ApplicationController

  def index
   @purchase_address = PurchaseAddress.new(@item_params) #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  @item = Item.find(params[:item_id])
  end

  def create 
    @purchase_address = PurchaseAddress.new(purchase_params)
    @item = Item.find(params[:item_id])
    
    if  @purchase_address.valid?
     pay_item
     @purchase_address.save
     redirect_to root_path
    else
      render :index   
    end
  end

  private

    def purchase_params
    params.permit(:postalcoad, :prefecture_id, :city, :apartment, :addresses, :phon_number, :item_id, :token).merge( user_id: current_user.id)  
    end
    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(  
        amount: @item.price,            
        card: @purchase_address.token,  
        currency: 'jpy'                 
          ) 
    end
end

