class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.string :Nombre
      t.string :Calle
      t.string :Numero
      t.integer :CP
      t.string :Provincia
      t.string :Localidad
      t.string :CIF
      t.decimal :NumeroFactura

      t.timestamps null: false
      
      t.belongs_to :pedidos, index: true
      
    end
  end
end
