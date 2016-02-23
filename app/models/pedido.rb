class Pedido < ActiveRecord::Base
  
  
  has_many :productos
  has_one :facturas
  
  def to_s
    "#{@usuario},#{@mail},#{@precio}"
  end
end
