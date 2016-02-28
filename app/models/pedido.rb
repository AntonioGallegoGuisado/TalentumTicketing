class Pedido < ActiveRecord::Base
  
  
  belongs_to :producto
  has_many :codigo
  has_many :entrada
  has_one :factura
  #pedido.includes(:productos, :facturas)
  
  #def to_s
  #  "#{@usuario},#{@mail},#{@precio}"
  #end
  def to_s
    "Pedido##{self.id}"
  end
end
