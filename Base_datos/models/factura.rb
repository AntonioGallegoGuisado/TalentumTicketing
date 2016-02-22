class Factura < ActiveRecord::Base
  
  has_one :pedido
end
