class CodigosController < ApplicationController
  def index
    @productos = Producto.all
    @listadoProductosCodigo = Producto.where(:tipoProducto=> "codigo")
  end
end
