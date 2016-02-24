class Entrada < ActiveRecord::Base
  
  belongs_to :producto
  has_one :producto
  #entrada.includes(:productos)
  
  #def to_s
  #  "#{@codigo},#{@vendido}"
  #end
end
