class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.string :Usuario
      t.string :Mail
      t.decimal :Precio

      t.timestamps null: false
      
      t.belongs_to :facturas, index: true
      
    end
  end
end
