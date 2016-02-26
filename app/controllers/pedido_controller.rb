class PedidoController < ApplicationController
  
  
  def index
    @pedidos = Pedido.all
    end
    
    def pagarVista
    @pedidoProvisional = Pedido.new
    @pedidoProvisional.mail = params[:mail]
    @pedidoProvisional.precio = params[:precio]
    render :pagoPaypal
    end
    
    def pagoPaypal
    @facturas = Factura.new
    @facturas.nombre = params[:nombre]
    @facturas.calle = params[:calle]
    @facturas.numero = params[:numero]
    @facturas.cp = params[:cp]
    @facturas.localidad = params[:localidad]
    @facturas.cif = params[:cif]
    @facturas.numeroFactura = params[:numeroFactura]
    @facturas.importe = @pedidoProvisional.precio
    @facturas.save
    @pedidoProvisional.save
    render :facturar
    end
  
  
 
  
  
  
 
  
 
  
  
  
  
  
end
