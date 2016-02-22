# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


productos.create!(Nombre: 'Codigo de prueba', Titular: 'Prueba de producto codigo', Descripcion: 'Esto es un producto de prueba, vendiendo el codigo de prueba', Precio: 10, Estado: 'activo', Iniciales: 1, Disponibles: 1, TipoProducto: 'codigo')
codigos.create!(Codigo: '01234', Vendido: false, productos_id: 1)