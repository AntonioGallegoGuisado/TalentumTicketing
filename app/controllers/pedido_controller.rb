class PedidoController < ApplicationController
 
  def index
    @pedidos = Pedido.all
  end
  
  def show
    @pedidos = Pedido.all
  end

   def create
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
    @factura.provincia = params[:provincia]
    @factura.importe = params[:precio]
    @factura.numeroFactura = @pedido.id
 
    @pedido.factura = @factura

    @pedido.save
    
    if @pedido.save
      redirect_to @pedido.paypal_url("/pedido/index")
     
    else
      render :new
    end
    
     generarCorreo
      
  end

  def new
    @productos = Producto.find(params[:id])
  end
  
   protect_from_forgery except: [:hook]
   
  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @pedido = Pedido.find params[:invoice]
      @pedido.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
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