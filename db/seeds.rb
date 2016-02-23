# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Producto.create!(Nombre: 'Codigo de prueba', Titular: 'Prueba de producto codigo', Descripcion: 'Esto es un producto de prueba, vendiendo codigos de prueba', Precio: 10, Estado: 'activo', Iniciales: 3, Disponibles: 2, TipoProducto: 'codigo')
Codigo.create!(Codigo: '01234', Vendido: true, productos_id: 1)
Codigo.create!(Codigo: '01235', Vendido: false, productos_id: 1)
Codigo.create!(Codigo: '01236', Vendido: false, productos_id: 1)
Factura.create!(Nombre: 'Usuario Prueba', Calle: 'C/Prueba', Numero: 1, CP: 28021, Provincia: 'Madrid', Localidad: 'Madrid', CIF: '123456-D', NumeroFactura: 0001, pedidos_id: 1)
Pedido.create!(Mail: 'ejemplo@ejemplo.com', Precio: 10, facturas_id:1)

Producto.create!(Nombre: 'Entrada de prueba', Titular: 'Prueba de producto entrada', Descripcion: 'Esto es un producto de prueba, vendiendo entradas de prueba', Precio: 10, Estado: 'activo', Iniciales: 3, Disponibles: 2, TipoProducto: 'entrada')
Entrada.create!(Codigo: '01234', Vendido: true, productos_id: 2)
Entrada.create!(Codigo: '01235', Vendido: false, productos_id: 2)
Entrada.create!(Codigo: '01236', Vendido: false, productos_id: 2)
Factura.create!(Nombre: 'Usuario Prueba', Calle: 'C/Prueba', Numero: 1, CP: 28021, Provincia: 'Madrid', Localidad: 'Madrid', CIF: '123456-D', NumeroFactura: 0002, pedidos_id: 2)
Pedido.create!(Mail: 'ejemplo@ejemplo.com', Precio: 10, facturas_id:2)
