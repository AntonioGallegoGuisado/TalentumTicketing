class ProductoController < ApplicationController
    def index
    @productos = Producto.all
    end
  
  def show
    @producto = Producto.find(params[:id])
  end
  
  def buscar
    palabra=params[:busqueda]
    #El .where devuelve el array con los registros que encuentra
    @listadoProductosEncontrados = Producto.where(["descripcion LIKE ?", "%#{palabra}%"])
    @productos = Producto.all
  end
  
end
