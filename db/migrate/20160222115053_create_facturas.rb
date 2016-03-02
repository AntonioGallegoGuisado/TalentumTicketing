class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.string :nombre
      t.string :calle
      t.string :numero
      t.string :cp
      t.string :provincia
      t.string :localidad
      t.string :cif
      t.integer :numeroFactura
      t.decimal :importe

      t.timestamps null: false
      
      t.belongs_to :pedido, index: true
      
    end
  end
end
