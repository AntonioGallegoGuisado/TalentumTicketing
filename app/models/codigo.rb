class Codigo < ActiveRecord::Base
  
  
  has_one :productos
  
  validates_uniqueness_of :Codigo
  
  def to_s
    "#{@codigo},#{@vendido}"
  end
end
