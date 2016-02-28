class Codigo < ActiveRecord::Base
  
  belongs_to :producto
  belongs_to :pedido
  #has_one :producto
  #codigo.includes(:productos)
  
  validates_uniqueness_of :codigo
  
  #def to_s
  #  "#{@codigo},#{@vendido}"
  #end
end
