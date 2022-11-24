class Admin::ItemsController < ApplicationController
    
    def new
        @item = Item.new
        @customer=current_customer
    end 
    
    def create
        item =Item.new(item_params)
        item.save
        redirect_to admin_item_path(item.id)
    end 
    
    def index
        @items=Item.all
        @customer=current_customer
    end 
    
    def show
        @item = Item.find(params[:id])
        @customer=current_customer
    end 
    
    def edit
        @item = Item.find(params[:id])
        @customer=current_customer
    end 
    
    def update
        @item= Item.find(params[:id])
        @item.update(item_params)
        redirect_to admin_items_path
    end 
    
# ストロングパラメータ
    private
    
      def item_params
        params.require(:item).permit(:name, :introduction, :price, :is_active, :created_at, :updated_at, :is_active, :genre_id)
      end    
end


