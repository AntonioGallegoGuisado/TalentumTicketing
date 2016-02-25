class Compra < ApplicationMailer
  
  def correoCompra (destinatario,pedido,factura)
  
  puts "Entra en correo compra"
  

  @factura=factura
  @pedido=pedido
  @destinatario=destinatario
  mail(to: @destinatario, subject: 'Compra realizada')
  
  end
  
end
