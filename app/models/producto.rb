class Producto < ActiveRecord::Base
  
  
  has_many :codigos
  has_many :entradas
  
  def to_s
    "#{@nombre},#{@titular},#{@descripcion},#{@imagen},#{@precio},#{@estado},#{@iniciales},#{@disponibles},#{@tipoProducto}"
  end
end
