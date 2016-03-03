class ReportPdf < Prawn::Document
  def initialize(pedido)
    super()
    @pedido = pedido
    
    
    header
    text_content
  end

  def header
    #Insertamos el logo de Ticketing
    image "#{Rails.root}/app/assets/images/ticketinglogo.png", width: 150, height: 28
  end

  def text_content
      if @pedido.producto.tipoProducto == "entrada"
        pedidoId=@pedido.id
        entradas=Entrada.all
        entrada=entradas.where(:pedido_id => pedidoId)
        entrada=entrada.first
        codigoComprado=entrada.codigo
        productoComprado=@pedido.producto.titular
      end
      
      if @pedido.producto.tipoProducto == "codigo"
        pedidoId=@pedido.id
        codigos=Codigo.all
        codigo=codigos.where(:pedido_id => pedidoId)
        codigo=codigo.first
        codigoComprado=codigo.codigo
        productoComprado=@pedido.producto.titular
      end
      move_down 30      
      text "Detalle de su pedido", size: 16, style: :bold
      move_down 10
      stroke do
          horizontal_rule
          stroke_color '49a0ee'
      end
      move_down 15
      text "Su número de factura es: #{@pedido.factura.numeroFactura}",:size => 12, :spacing => 4
      text "Nombre: #{@pedido.nombre}", :size => 12, :spacing => 4
      text "Importe:  #{@pedido.precio} euros",:size => 12, :spacing => 4
      move_down 10
     stroke do
          horizontal_rule
          stroke_color '49a0ee'
      end
      move_down 15
      text "Producto comprado: #{productoComprado}",:size => 12, :spacing => 4
      move_down 30
      text "Código comprado",:size => 12, :spacing => 4, :align => :center
      move_down 20
      text "#{codigoComprado}", :size => 18, :spacing => 4, :align => :center   
      move_down 10
      stroke do
          horizontal_rule
          stroke_color '49a0ee'
      end
      move_down 15
      text "Gracias por confiar en nosotros - Ticketing", size: 12, style: :italic
      
   end 
end