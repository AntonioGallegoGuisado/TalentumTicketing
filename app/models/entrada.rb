class Entrada < ActiveRecord::Base
  
  belongs_to :producto
  belongs_to :pedido
  #has_one :producto
  #entrada.includes(:productos)
  
  #def to_s
  #  "#{@codigo},#{@vendido}"
  #end
end
