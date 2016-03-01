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
      text "Detalle de su pedido", size: 15, style: :bold
      text "Aqui mete el pedido"
    end 
end