class PedidoController < ApplicationController
 
  def index
    @pedidos = Pedido.all
  end

  def pagarVista

    @pedido = Pedido.new
    @pedido.mail = params[:mail]
    @pedido.precio = params[:precio]

    @factura = Factura.new
    @factura.nombre = params[:nombre]
    @factura.calle = params[:calle]
    @factura.numero = params[:numero]
    @factura.cp = params[:cp]
    @factura.localidad = params[:localidad]
    @factura.cif = params[:cif]

    @factura.importe = params[:precio]

    #TODO: generar estos 2 campos correctamente
    @factura.numeroFactura = 5
    @factura.provincia = 'Madrid'

    @pedido.factura= @factura

    @pedido.save
    
    generarCorreo
  end

  private

  def generarCorreo
    
    
    puts "***** id pedido: #{@pedido.id}"
    
    
    # #leemos la base de datos
    # facturas= Factura.all
    # pedidos = Pedido.all
    # productos = Producto.all
# 
    # #buscamos el pedido, su factura y su producto
    # for factura in facturas
      # facturaActual = Factura.where(factura.numeroFactura => @facturas.numeroFactura)
    # end
    # for pedido in pedidos
      # pedidoActual = Pedido.where(pedido.factura.numeroFactura => @facturas.numeroFactura)
    # end
    # for producto in productos
      # productoActual=Producto.where(producto.pedido.factura.numeroFactura => @facturas.numeroFactura)
    # end
     
     
     #creamos el objeto destinatario
     #destinatario = Destinatario.create({ email: @pedido.mail })
 
     #llamamos al mailer para enviar el correo
     puts "#{@pedido.mail},#{@pedido},#{@pedido.factura}"
     Compra.correoCompra(@pedido.mail,@pedido,@pedido.factura).deliver
     
  end
end