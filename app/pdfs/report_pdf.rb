class ReportPdf < Prawn::Document
  def initialize(pedido)
    super()
    @pedido = pedido
    header
    text_content
  end

  def header
    #Insertamos el logo de Ticketing
    image "#{Rails.root}/app/assets/images/logoticketing3.png", width: 400, height: 50
  end

  def text_content
      text "Detalle de su pedido", size: 16, style: :bold
      text "Su numero de factura es: #{@pedido.factura}",:size => 12, :spacing => 4
      text "Nombre: #{@pedido.nombre}", :size => 12, :spacing => 4
      text "Importe:  #{@pedido.precio}",:size => 12, :spacing => 4
      text "Codigo comprado: #{@pedido.codigo}"
      
   end 
end