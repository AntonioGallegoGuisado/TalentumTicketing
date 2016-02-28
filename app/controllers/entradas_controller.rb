class EntradasController < ApplicationController
  def index
    @productos = Producto.all
    @listadoProductosCodigo = Producto.where(:tipoProducto=> "entrada")
  end
end
