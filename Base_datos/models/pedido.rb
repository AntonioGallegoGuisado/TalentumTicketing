class Pedido < ActiveRecord::Base
  
  
  has_many :productos
  has_one :facturas
end
