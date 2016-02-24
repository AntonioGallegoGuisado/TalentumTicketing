class Factura < ActiveRecord::Base
  
  belongs_to :pedido
  #factura.includes(:pedidos)
  
  #def to_s
  #  "#{@nombre},#{@calle},#{@numero},#{@cp},#{@provincia},#{@localidad},#{@cif},#{@numeroFactura}"
  #end
end
