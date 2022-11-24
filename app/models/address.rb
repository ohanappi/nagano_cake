class Address < ApplicationRecord
    belongs_to :customer
    
end

def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
end
