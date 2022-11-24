class Admin::OrdersController < ApplicationController
  def show
    @customer=current_customer
  end
end
