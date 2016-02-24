class Producto < ActiveRecord::Base
  
  belongs_to :pedido
  has_many :codigo
  has_many :entrada
  #producto.includes(:codigos, :entradas)
  
  #def to_s
  #  "#{@nombre},#{@titular},#{@descripcion},#{@imagen},#{@precio},#{@estado},#{@iniciales},#{@disponibles},#{@tipoProducto}"
  #end
end
