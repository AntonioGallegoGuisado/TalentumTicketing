# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Producto.create!(nombre: 'Codigo de prueba', titular: 'Prueba de producto codigo', descripcion: 'Esto es un producto de prueba, vendiendo codigos de prueba', precio: 10, estado: 'activo', stock: 2, tipoProducto: 'codigo', imagen: "codigo-qr.png")
Codigo.create!(codigo: '01234', vendido: true, producto_id: 1, pedido_id: 1)
Codigo.create!(codigo: '01235', vendido: false, producto_id: 1)
Codigo.create!(codigo: '01236', vendido: false, producto_id: 1)
Factura.create!(nombre: 'Usuario Prueba', calle: 'C/Prueba', numero: 1, cp: 28021, provincia: 'Madrid', localidad: 'Madrid', cif: '123456-D', numeroFactura: 0001, pedido_id: 1, importe: 10)
Pedido.create!(mail: 'ejemplo@ejemplo.com', precio: 10, factura_id:1, nombre: "Usuario de prueba", calle: "Calle de prueba", numero: "2", cp: "28023", localidad: "Madrid", provincia: "Madrid", cantidad: 1, producto_id: 1)

Producto.create!(nombre: 'Entrada de prueba', titular: 'Prueba de producto entrada', descripcion: 'Esto es un producto de prueba, vendiendo entradas de prueba', precio: 10, estado: 'activo', stock: 2, tipoProducto: 'entrada', imagen: "news_entrada.png")
Entrada.create!(codigo: '01234', vendido: true, producto_id: 2, pedido_id: 2)
Entrada.create!(codigo: '01235', vendido: false, producto_id: 2)
Entrada.create!(codigo: '01236', vendido: false, producto_id: 2)
Factura.create!(nombre: 'Usuario Prueba', calle: 'C/Prueba', numero: 1, cp: 28021, provincia: 'Madrid', localidad: 'Madrid', cif: '123456-D', numeroFactura: 0002, pedido_id: 2, importe: 10)
Pedido.create!(mail: 'ejemplo@ejemplo.com', precio: 10, factura_id:2, nombre: "Usuario de prueba", calle: "Calle de prueba", numero: "2", cp: "28023", localidad: "Madrid", provincia: "Madrid", cantidad: 1, producto_id: 2)
