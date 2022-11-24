class Public::CartItemsController < ApplicationController
    
    def index
        @customer=current_customer
        @cart_items=@customer.cart_items
        @item=Item.all
        @total = 0
    end 
    
    
    def create
        @cart_item = CartItem.find_by(customer_id:current_customer.id,item_id:cart_item_params[:item_id])
        if @cart_item
            amount=cart_item_params[:amount].to_i+@cart_item.amount
            @cart_item.update(amount: amount)
        else 
            cart_item=CartItem.new(cart_item_params)
            cart_item.save
        end 
        redirect_to cart_items_path
    end
    
    def destroy
        cart_item=CartItem.find(params[:id])
        cart_item.destroy
        redirect_to cart_items_path
    end 
    
    def destroy_all
        customer=current_customer
        cart_item=customer.cart_items
        customer.cart_items.destroy_all
        redirect_to items_path
    end 

  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
  
end
