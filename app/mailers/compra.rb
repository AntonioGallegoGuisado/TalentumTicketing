class Compra < ApplicationMailer
  
  def correoCompra (destinatario,pedido,factura,codigoComprado)
  
  puts "Entra en correo compra"
  

  @factura=factura
  @pedido=pedido
  @destinatario=destinatario
  @codigoComprado=codigoComprado
  mail(to: @destinatario, subject: 'Compra realizada')
  
  end
  
end
