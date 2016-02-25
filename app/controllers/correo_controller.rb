
class CorreoController < ApplicationController
  
  def enviarCorreoCompra (correo,numeroFactura)
    # puts "entra en enviarCorreoCompra"
    # #leemos la base de datos
    # facturas= Factura.all
    # pedidos = Pedido.all
    # productos = Producto.all
#     
    # #buscamos el pedido, su factura y su producto
    # factura = Factura.where(facturas.numeroFactura => numeroFactura.to_i)
    # pedido = Pedido.where(pedidos.factura.numeroFactura => numeroFactura.to_i)
    # producto=Producto.where(productos.pedido.factura.numeroFactura => numeroFactura.to_i)
#     
    # #creamos el objeto destinatario
    # destinatario = Destinatario.create({ email: 'qebranto@gmail.com' })
#     
    # #llamamos al mailer para enviar el correo
    # Compra.correoCompra(destinatario,factura,producto).deliver
  end
  
end
