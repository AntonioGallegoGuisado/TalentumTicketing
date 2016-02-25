class ProductoController < ApplicationController
    def index
    @productos = Producto.all
    end
  
  def detalles_producto
    @productos = Producto.find(params[:id])
   
  end
  
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

end
