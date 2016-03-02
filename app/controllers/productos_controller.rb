class ProductosController < ApplicationController
    def index
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
    @producto = Producto.find(params[:id])
  end
  
  def search
    palabra=params[:busqueda]
    #El .where devuelve el array con los registros que encuentra
    busquedaDescripcion = Producto.where(["descripcion LIKE ?" , "%#{palabra}%"])
    busquedaTitular = Producto.where(["titular LIKE ?" , "%#{palabra}%"])
    #Buscamos coincidencias
    duplicados=busquedaDescripcion & busquedaTitular
    #quitamos las coincidencias de una lista
    busquedaTitular=busquedaTitular-duplicados
    #incluimos en el mismo array los registros diferentes encontrados
    @listadoProductosEncontrados=busquedaDescripcion + busquedaTitular
    puts @listadoProductosEncontrados
    @productos = Producto.all
   
  end
  
end
