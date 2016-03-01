class Compra < ApplicationMailer
  
  def correoCompra (pedido,codigoComprado)
  
  puts "Entra en correo compra"
  

  @factura=pedido.factura
  @pedido=pedido
  @destinatario=pedido.mail
  @codigoComprado=codigoComprado
  pdf = ReportPdf.new(pedido)
  attachments['Detalle_Compra.pdf'] = pdf.render
  mail(to: @destinatario, subject: 'Compra realizada')
  
  end
  
end
