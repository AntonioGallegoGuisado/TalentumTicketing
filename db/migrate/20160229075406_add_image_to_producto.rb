class AddImageToProducto < ActiveRecord::Migration
  def change
    #Para que suba la foto que le indiquemos
    add_attachment :productos, :imagen
  end
end
