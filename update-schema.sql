-- ===========================
-- ACTUALIZACIÓN DE ESQUEMA: VINCULAR PRODUCTOS A CATEGORÍAS
-- ===========================

-- 1. Agregar columna categoria_id a la tabla productos
ALTER TABLE productos 
ADD COLUMN IF NOT EXISTS categoria_id BIGINT REFERENCES categorias(id) ON DELETE SET NULL;

-- 2. Crear un índice para mejorar la velocidad de búsqueda por categoría
CREATE INDEX IF NOT EXISTS idx_productos_categoria_id ON productos(categoria_id);

-- 3. (Opcional) Asignar una categoría por defecto a los productos existentes
-- Si tienes categorías creadas, esto asignará la primera categoría encontrada a los productos "huérfanos".
-- UPDATE productos SET categoria_id = (SELECT id FROM categorias LIMIT 1) WHERE categoria_id IS NULL;
