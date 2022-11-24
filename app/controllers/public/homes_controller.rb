class Public::HomesController < ApplicationController
    def top
        @genres=Genre.all
        @customer=current_customer
    end 
    
    def about
        
    end 
end
