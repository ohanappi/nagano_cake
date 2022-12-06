class Public::OrdersController < ApplicationController
    
    
    def new
        @customer=current_customer
        @order=Order.new
        @addresses=current_customer.address
    end 
    
    

    def confirm
        @customer=current_customer
        @cart_items=CartItem.all
        @order= Order.new(order_params)
        @cart_items = current_customer.cart_items.all
        
        if params[:order][:address_number] == "0"
            @order.post_code=current_customer.postal_code
            @order.address_home=current_customer.address
            @order.address_name=current_customer.last_name + current_customer.first_name
            
        elsif params[:order][:address_number] == "1"
            ship = Address.find(params[:order][:customer_id])
    　　　　　　　#orderのmember_id(=カラム)でアドレス(帳)を選び、そのデータ送る
            @order.shipping_post_code = ship.post_code
            @order.shipping_address = ship.address
            @order.shipping_name = ship.name
        elsif params[:order][:address_number] = "2"
            
            @order.post_code = params[:order][:post_code]
            @order.address_home = params[:order][:address_home]
            @order.address_name = params[:order][:address_name]
        else
            render'new'
        end
        
        
        
    end 
    
    def create
        @order=Order.new(order_params)
        @order.save
        redirect_to orders_confirm_path
    end 
    
    def show
        @customer=current_customer
    end 

    
    

    private
    
    def order_params
        params.require(:order).permit(:customer_id, :status, :cost, :postage, :address_home, :address_name, :post_code, :payment_method)
    end 
end 