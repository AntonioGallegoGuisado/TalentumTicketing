class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :titular
      t.string :descripcion
      t.string :imagen
      t.decimal :precio
      t.string :estado
      t.integer :iniciales
      t.integer :disponibles
      t.string :tipoProducto

      t.timestamps null: false
      
      t.belongs_to :pedido, index: true
      
    end
  end
end
