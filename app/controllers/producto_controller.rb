class ProductoController < ApplicationController
  
  def index
    puts "Entrando en index"
    @productos=Producto.all
    puts @productos
    #puts @productos.first.pedido
    #puts @productos.first.pedido.email
    puts "-----"
    @pedidos = Pedido.all
    codigo = @pedidos.first.producto.first.codigo.first.id
    puts codigo
  end
  
  
end
