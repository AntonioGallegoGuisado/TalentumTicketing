class CreateCodigos < ActiveRecord::Migration
  def change
    create_table :codigos do |t|
      t.string :codigo
      t.boolean :vendido

      t.timestamps null: false
      
      t.belongs_to :producto, index: true
      
    end
  end
end
