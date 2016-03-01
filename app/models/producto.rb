class Producto < ActiveRecord::Base
  
  #belongs_to :pedido
  has_many :pedido
  has_many :codigo
  has_many :entrada
  #producto.includes(:codigos, :entradas)
  #@productos=Producto.pedido
  
  #after_find do |f|
  #  f.mostrar=self.nombre
  #end
  
  
  #Para que meta la foto en la base de datos
  has_attached_file :imagen,styles: { medium: '325x325', thumb: '175x175'}
  #Estamos validando que le estemos introduciendo una imagen, en teoría este formato coge cualquier extensión
  validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\Z/
  
  def to_s
    "#{self.nombre}"
  end
end