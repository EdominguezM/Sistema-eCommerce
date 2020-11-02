# README

Implementanción de una lista de productos desde el cátalogo.

1- Como primera instancia la vista 'home' debe solamente mostrar productos únicos, los cúales se obtienen desde la tabla llamada 'BaseProduct'.

2- En segunda instancia en la misma vista 'home' se debe mostrar productos que contengan stock positivo.

3- Las variaciones o carácteristicas se encuentran bajo la tabla 'product' la cuál depende de la tabla llamada 'BaseProduct'

```
  Para aplicar lo anterior es necesario construir los siguientes métodos:

  a.- Entrega todos los productos del producto base.

  def children
    children = self.products
  end

  b.- Entrega la suma total en stock de los productos bajo el producto base.
  
  def stock_products
    self.products.sum(:stock)
  end

  Para visualizar los resultados se debe recorrer los datos que vienen ya filtrados cuando exista stock positivo (> '0'):

  @BaseProducts.each do |base_product|
    base_product.children.to_a
    base_product.stock_products
  end


  Como parte del plan de marketing se estipulan dos tipos de cupones para entrega a los clientes:

  1.- cupón por monto: este no debe ser mayor a la compra y en un futuro se puede validar si el monto de la compra supera un monto x, pero para comenzar puedes aplicar un monto bien bajo.

  2.- cupón aplicando un porcentaje: para la

  consideraciones: se ha creado una tabla cupones para que solo los administradores puedan acceder y crear cupones teniendo en cuenta lo siguiente:

  a.- En cada cupón existe una columna que indica si es monto o porcentaje.
  b.- Columna de vencimiento de los cupones.
  c.- cantidad de cupones entregados, cuando la cantidad sea lo estipuldo la aplicación no permitirá cursar más de esa cantidad.
  d.- para el caso que el cupón sea único indicar como cantidad 1 en columna limite.


  Para que el cátalogo muestre solo un producto por cada tipo se deberá agregr una columna llamada 'modelo' para agrupar y mostrar en la vista index solo el modelo del producto y crear una vista show para mostrar la descripción y los colores disponibles y stock, para esto se creará un scope que nos permita filtrar el stock > '0'.


