## Consulta 1 — LEFT JOIN

Se utilizó LEFT JOIN porque necesitamos conservar todos los productos
que existen en el catálogo, aunque no tengan ninguna venta asociada.

La tabla productos se encuentra a la izquierda del JOIN, por lo que
todos sus registros se mantienen en el resultado.

Si utilizáramos INNER JOIN, solamente aparecerían los productos que
tienen al menos una venta. Se perderían los productos que existen en
el catálogo pero nunca fueron vendidos.

En este ejercicio, los productos 108 y 109 no tienen ventas.

Cuando la columna venta_id aparece como NULL, significa que el producto
existe en el catálogo pero no existe una venta asociada a ese producto.

## Consulta 2 — RIGHT JOIN

Se utilizó RIGHT JOIN para conservar todas las ventas registradas,
incluyendo aquellas cuyo producto no existe en el catálogo.

En esta consulta, la tabla productos se encuentra a la izquierda y
la tabla ventas se encuentra a la derecha.

Por lo tanto, se mantienen todas las ventas.

El filtro:

WHERE productos.producto_id IS NULL

permite identificar las ventas que no tienen un producto correspondiente
en el catálogo.

En los datos de prueba, la venta número 10 tiene producto_id = 999.
Como el producto 999 no existe en la tabla productos, las columnas de
productos aparecen como NULL.

Esto representa un registro huérfano y puede indicar un posible error
en la carga o en la calidad de los datos.


## Consulta 3 — FULL OUTER JOIN

Un FULL OUTER JOIN permite obtener todos los registros de ambas tablas,
tanto los que tienen coincidencias como los que no tienen coincidencias.

MySQL no soporta FULL OUTER JOIN directamente. Por este motivo, se
simula combinando un LEFT JOIN y un RIGHT JOIN mediante UNION.

Esta consulta permite realizar una auditoría completa entre el catálogo
de productos y las ventas.

Permite identificar:

- Productos que tienen ventas.
- Productos que nunca fueron vendidos.
- Ventas cuyo producto no existe en el catálogo.

Un caso real para utilizar FULL OUTER JOIN sería comparar un catálogo
actual de productos con una base histórica de ventas para detectar
diferencias entre ambas fuentes de información.

## Conclusión

Los JOIN externos permiten detectar información que un INNER JOIN
ocultaría.

En este ejercicio se identificaron productos que existen en el catálogo
pero no tienen ventas y también una venta cuyo producto no existe en el
catálogo.

Los valores NULL son importantes porque permiten detectar estas
diferencias y posibles problemas de calidad de datos.
