class Producto < ActiveRecord::Base
  
  belongs_to :pedido
  has_many :codigo
  has_many :entrada
  #producto.includes(:codigos, :entradas)
  productos=Producto.all
  #TODO: filtro para que saque solamente el titular del producto actual
  #producto=producto.titular
  #def to_s
  #  "#{@nombre},#{@titular},#{@descripcion},#{@imagen},#{@precio},#{@estado},#{@iniciales},#{@disponibles},#{@tipoProducto}"
  #end
end