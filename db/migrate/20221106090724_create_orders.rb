class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      t.integer :status
      t.integer :cost
      t.integer :postage
      t.string :address_home
      t.string :address_name
      t.string :post_code
      t.integer :payment_method

      t.timestamps
    end
  end
end
