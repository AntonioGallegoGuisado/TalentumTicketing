class ProductoController < ApplicationController
    def index
    @productos = Producto.all
    end
  
  def detalles_producto
    @productos = Producto.find(params[:id])
   
  end
  
   def formularioRegistro
    @productos = Producto.find(params[:id])
  end
  
<<<<<<< HEAD
  
  
  def detalle_producto
    @productos = Producto.find(params[:id])
   
  end
  
  def formularioRegistro
    @productos = Producto.find(params[:id])
  end
    

  
  
=======
  def mostrar_codigos
    @productos = Producto.all
    @listadoProductosCodigo = Producto.where(:tipoProducto=> "codigo")
  end

  def mostrar_entradas
    @productos = Producto.all
    @listadoProductosCodigo = Producto.where(:tipoProducto=> "entrada")
  end
  
  def buscar
    palabra=params[:busqueda]
    #El .where devuelve el array con los registros que encuentra
    @listadoProductosEncontrados = Producto.where(["descripcion LIKE ?", "%#{palabra}%"])
    @productos = Producto.all
  end

>>>>>>> a112cd123b0884c3a2c51e3c2996e8afdd36bfac
end
