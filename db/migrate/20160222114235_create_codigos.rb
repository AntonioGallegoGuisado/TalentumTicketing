class CreateCodigos < ActiveRecord::Migration
  def change
    create_table :codigos do |t|
      t.string :Codigo
      t.boolean :Vendido

      t.timestamps null: false
      
      t.belongs_to :productos, index: true
      
    end
  end
end
