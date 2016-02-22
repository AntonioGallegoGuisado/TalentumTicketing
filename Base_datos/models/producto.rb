class Producto < ActiveRecord::Base
  
  
  has_many :codigos
  has_many :entradas
end
