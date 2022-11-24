class Public::CostomersController < ApplicationController
    
    def show
        @customer=current_customer
    end 
    
    def edit
        @customer=current_customer
    end 
    
    def update 
        customer=Customer.find(params[:id])
        customer.update(customer_params)
        redirect_to costomer_path(current_customer)
    end 
    
    def check
       @customer=current_customer
    end 
    
    def withdrawal
      @customers=Customer.find(params[:id])
      @customers.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
    end
    
    # 　def unsubscribe
    #     @customer = Customer.find_by(name: params[:name])
    #   end
    

    private
    
    def customer_params
        params.require(:customer).permit(:last_name, :first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number)
    end
end 
