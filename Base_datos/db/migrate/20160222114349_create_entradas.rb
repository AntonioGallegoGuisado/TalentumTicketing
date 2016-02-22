class CreateEntradas < ActiveRecord::Migration
  def change
    create_table :entradas do |t|
      t.string :Codigo
      t.boolean :Vendido

      t.timestamps null: false
      
      t.belongs_to :productos, index: true
      
    end
  end
end
