class Public::AddressController < ApplicationController
    
    def new
        @addresses=Address.new
    end 
    def index
        @customer=current_customer
    end 
    
    def edit
        @customer=current_customer
    end 
end
