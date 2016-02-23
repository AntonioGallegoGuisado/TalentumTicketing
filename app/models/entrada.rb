class Entrada < ActiveRecord::Base
  
  
  has_one :productos
  
  def to_s
    "#{@codigo},#{@vendido}"
  end
end
