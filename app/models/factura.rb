class Factura < ActiveRecord::Base
  
  has_one :pedido
  
  def to_s
    "#{@nombre},#{@calle},#{@numero},#{@cp},#{@provincia},#{@localidad},#{@cif},#{@numeroFactura}"
  end
end
