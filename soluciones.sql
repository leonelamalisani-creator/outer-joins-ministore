-- ══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- ══════════════════════════════════════════

-- ── CONSULTA 1: LEFT JOIN ─────────────────
-- Pregunta de negocio: ¿Qué productos del catálogo nunca fueron vendidos?
-- Se muestran todos los productos y sus ventas asociadas.
-- Los productos sin ventas aparecen con NULL.

SELECT
    productos.producto_id,
    productos.nombre,
    productos.categoria,
    productos.precio,
    ventas.venta_id,
    ventas.producto_id AS producto_id_venta,
    ventas.cliente_id,
    ventas.cantidad,
    ventas.fecha_venta
FROM productos
LEFT JOIN ventas
    ON productos.producto_id = ventas.producto_id
ORDER BY productos.producto_id;


-- ── CONSULTA 2: RIGHT JOIN ────────────────
-- Pregunta de negocio: ¿Existen ventas registradas con productos
-- que no figuran en nuestro catálogo?
-- Se identifican las ventas cuyo producto no existe en productos.

SELECT
    productos.producto_id,
    productos.nombre,
    productos.categoria,
    productos.precio,
    ventas.venta_id,
    ventas.producto_id AS producto_id_venta,
    ventas.cliente_id,
    ventas.cantidad,
    ventas.fecha_venta
FROM productos
RIGHT JOIN ventas
    ON productos.producto_id = ventas.producto_id
WHERE productos.producto_id IS NULL
ORDER BY ventas.venta_id;


-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- MySQL no soporta FULL OUTER JOIN directamente.
-- Se simula utilizando LEFT JOIN y RIGHT JOIN con UNION.

SELECT
    productos.producto_id,
    productos.nombre,
    productos.categoria,
    productos.precio,
    ventas.venta_id,
    ventas.producto_id AS producto_id_venta,
    ventas.cliente_id,
    ventas.cantidad,
    ventas.fecha_venta
FROM productos
LEFT JOIN ventas
    ON productos.producto_id = ventas.producto_id

UNION

SELECT
    productos.producto_id,
    productos.nombre,
    productos.categoria,
    productos.precio,
    ventas.venta_id,
    ventas.producto_id AS producto_id_venta,
    ventas.cliente_id,
    ventas.cantidad,
    ventas.fecha_venta
FROM productos
RIGHT JOIN ventas
    ON productos.producto_id = ventas.producto_id

ORDER BY producto_id;
