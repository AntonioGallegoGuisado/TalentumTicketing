class Codigo < ActiveRecord::Base
  
  belongs_to :producto
  #has_one :producto
  #codigo.includes(:productos)
  
  validates_uniqueness_of :codigo
  
  #def to_s
  #  "#{@codigo},#{@vendido}"
  #end
end
