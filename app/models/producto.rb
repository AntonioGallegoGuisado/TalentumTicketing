class Producto < ActiveRecord::Base
  
  #belongs_to :pedido
  has_many :pedido
  has_many :codigo
  has_many :entrada
  #producto.includes(:codigos, :entradas)
  #@productos=Producto.pedido
  
  #after_find do |f|
  #  f.mostrar=self.nombre
  #end
  
  def to_s
    "#{self.nombre}"
  end
end