class PurchasesController < ApplicationController

def index
@purchase_address = PurchaseAddress.new(@item_params) #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
@item = Item.find(params[:item_id])
end

def new

end


end
