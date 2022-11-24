class Public::ItemsController < ApplicationController
    
    def index
        @customer=current_customer
        @items=Item.all
        @genres=Genre.all
    end
    
    def show
        @customer=current_customer
        @item=Item.find(params[:id])
        @cart_item=CartItem.new
        @genres=Genre.all
    end 
    
    def create
        cart_item=CartItem.new(cart_item_params)
        cart_item.save
        redirect_to cart_item_path
    end
    
    
    private
    
    def cart_params
         params.require(:item).permit(:genre_id,:name,:introduction,:price,:is_active)
    end 



end
