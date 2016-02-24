class Pedido < ActiveRecord::Base
  
  
  has_many :producto
  has_one :factura
  #pedido.includes(:productos, :facturas)
  
  #def to_s
  #  "#{@usuario},#{@mail},#{@precio}"
  #end
end
