-- ===========================
-- CONFIGURACIÓN DE STORAGE PARA IMÁGENES
-- ===========================
-- Ejecutar este código en el SQL Editor de Supabase
-- DESPUÉS de haber ejecutado supabase-setup.sql

-- ===========================
-- CREAR BUCKET DE ALMACENAMIENTO
-- ===========================
-- Nota: Esto también se puede hacer desde la UI de Supabase
-- Storage > Create a new bucket

INSERT INTO storage.buckets (id, name, public)
VALUES ('productos-imagenes', 'productos-imagenes', true)
ON CONFLICT (id) DO NOTHING;

-- ===========================
-- POLÍTICAS DE STORAGE
-- ===========================

-- Permitir a TODOS ver las imágenes (lectura pública)
CREATE POLICY "Permitir lectura pública de imágenes"
ON storage.objects FOR SELECT
USING (bucket_id = 'productos-imagenes');

-- Permitir solo a usuarios autenticados subir imágenes
CREATE POLICY "Usuarios autenticados pueden subir imágenes"
ON storage.objects FOR INSERT
WITH CHECK (
    bucket_id = 'productos-imagenes' 
    AND auth.role() = 'authenticated'
);

-- Permitir solo a usuarios autenticados actualizar imágenes
CREATE POLICY "Usuarios autenticados pueden actualizar imágenes"
ON storage.objects FOR UPDATE
USING (
    bucket_id = 'productos-imagenes' 
    AND auth.role() = 'authenticated'
);

-- Permitir solo a usuarios autenticados eliminar imágenes
CREATE POLICY "Usuarios autenticados pueden eliminar imágenes"
ON storage.objects FOR DELETE
USING (
    bucket_id = 'productos-imagenes' 
    AND auth.role() = 'authenticated'
);

-- ===========================
-- VERIFICACIÓN
-- ===========================
-- Después de ejecutar este script, verifica en:
-- Supabase Dashboard > Storage
-- Deberías ver el bucket "productos-imagenes" creado
