class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.string :usuario
      t.string :mail
      t.decimal :precio

      t.timestamps null: false
      
      t.belongs_to :factura, index: true
      
    end
  end
end
