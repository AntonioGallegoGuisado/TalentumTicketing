class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :Nombre
      t.string :Titular
      t.string :Descripcion
      t.string :Imagen
      t.decimal :Precio
      t.string :Estado
      t.integer :Iniciales
      t.integer :Disponibles
      t.string :TipoProducto

      t.timestamps null: false
      
      t.belongs_to :pedidos, index: true
      
    end
  end
end
