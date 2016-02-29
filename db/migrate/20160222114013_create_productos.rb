class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :titular
      t.string :descripcion
      t.string :imagen
      t.decimal :precio
      t.string :estado
      t.integer :stock
      t.string :tipoProducto
      
      t.timestamps null: false
      
    end
  end
end
