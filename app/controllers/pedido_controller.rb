class PedidoController < ApplicationController
  
   def index
    @pedidos = Pedido.all
    end
    
    def pagarVista
     
    @pedidos = Pedido.new
    @pedidos.mail = params[:mail]
    @pedidos.precio = params[:precio]
    @pedidos.save
    @facturas = Factura.new
    @facturas.nombre = params[:nombre]
    @facturas.calle = params[:calle]
    @facturas.numero = params[:numero]
    @facturas.cp = params[:cp]
    @facturas.localidad = params[:localidad]
    @facturas.cif = params[:cif]
    @facturas.numeroFactura = @pedidos.id
    @facturas.pedido_id = @pedidos.id
    @facturas.importe = params[:precio]
    @facturas.save
    end
end
