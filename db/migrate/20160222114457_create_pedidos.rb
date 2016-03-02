class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      
      t.string :mail
      t.string :nombre
      t.string :calle
      t.string :numero
      t.string :cp
      t.string :localidad
      t.string :provincia
      t.decimal :precio
      t.integer :cantidad

      t.timestamps null: false
      
      t.belongs_to :producto, index: true
      t.belongs_to :factura, index: true
      
    end
  end
end
