class PedidosController < ApplicationController
 
  def index
    @pedidos = Pedido.all
        @productos = Producto.all
    for producto in @productos
      productoId=producto.id
      if producto.tipoProducto == "entrada"
        entradas=Entrada.where(:vendido => false)
        entradas=entradas.where(:producto_id => productoId)
        producto.stock=entradas.size
        producto.save
      end
      
      if producto.tipoProducto == "codigo"
        codigos=Codigo.where(:vendido => false)
        codigos=codigos.where(:producto_id => productoId)
        producto.stock=codigos.size
        producto.save
      end
      
    end
  end
  
  def show
    @@mail.deliver_now
    @pedidos = Pedido.all
  end

   def create
    #insertamos los datos recogidos en el formulario
    @pedido = Pedido.new
    @pedido.mail = params[:mail]
    @pedido.precio = params[:precio]
    @pedido.nombre = params[:nombre]
    @pedido.calle = params[:calle]
    @pedido.numero = params[:numero]
    @pedido.cp = params[:cp]
    @pedido.localidad = params[:localidad]
    @pedido.provincia = params[:provincia]
    #modificar el formulario para poder introducir la cantidad
    @pedido.cantidad=1
    #incluir producto
    id=params[:id].to_i
    @producto=Producto.find id
    @pedido.producto=@producto
    
    #insertamos los datos recogidos en el formulario
    @factura = Factura.new
    @factura.nombre = params[:nombre]
    @factura.calle = params[:calle]
    @factura.numero = params[:numero]
    @factura.cp = params[:cp]
    @factura.localidad = params[:localidad]
    @factura.cif = params[:cif]
    @factura.provincia = params[:provincia]
    @factura.importe = params[:precio]
    #generamos el numero de factura
    #leemos el ultimo numero de la base de datos
    #si no hay factura asignamos 0
    factura=Factura.last
    if factura == nil
      factura=Factura.new
      factura.numeroFactura=0
    end
    @factura.numeroFactura = (factura.numeroFactura+1)
    
    #relacionamos la factura con su pedido
    @pedido.factura = @factura
    
    #Buscamos el primer producto disponible
    if @producto.tipoProducto == "entrada"
      productoId=@producto.id
      @entrada=Entrada.where(:vendido => false)
      @entrada=@entrada.where(:producto_id => productoId)
      @entrada=@entrada.first
      puts "La entrada es: #{@entrada.codigo}"
      @entrada.vendido=true
    end
    
    if @producto.tipoProducto == "codigo"
      productoId=@producto.id
      @codigo=Codigo.where(:vendido => false)
      @codigo=@codigo.where(:producto_id => productoId)
      @codigo=@codigo.first
      puts "El codigo es: #{@codigo.codigo}"
      @codigo.vendido=true
    end
    
    #Guardamos el pedido
    @pedido.save
    
    #Relacionamos la entrada o el codigo con el pedido
    if @producto.tipoProducto == "entrada"
      #le asignamos la id del pedido a la entrada
      @entrada.pedido_id=@pedido.id
      @entrada.save
    end
    
    if @producto.tipoProducto == "codigo"
      #le asignamos la id del pedido al codigo
      @codigo.pedido_id=@pedido.id
      @codigo.save
    end
    
    if @pedido.save
      redirect_to @pedido.paypal_url("/pedidos/index")
     
    else
      render :new
    end
    
     generarCorreo
      
  end

  def new
    @productos = Producto.find(params[:id])
    @id=params[:id]
  end
  
   protect_from_forgery except: [:hook]
   
  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @pedido = Pedido.find params[:invoice]
      @pedido.update_attributes notification_params: params, status: "Completed", transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end

  private

  def generarCorreo
    
 
     #llamamos al mailer para enviar el correo
     puts "#{@pedido.mail},#{@pedido},#{@pedido.factura}"
     if @producto.tipoProducto == "entrada"
       codigoComprado=@entrada.codigo
     end
     
     if @producto.tipoProducto == "codigo"
       codigoComprado=@codigo.codigo
     end
     

     @@mail=Compra.correoCompra(@pedido,codigoComprado)#.deliver#! if @pedido.status == "Completed"
     #cuando paypal devuelva los parametros correctamente deberiamos enviar el correo solo cuando el status sea Completed
     
  end
  
end