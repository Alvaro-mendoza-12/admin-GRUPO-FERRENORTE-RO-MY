// ===========================
// CONFIGURACIÓN DE SUPABASE
// ===========================

const SUPABASE_URL = 'https://oohwmogmxtpouzyguikt.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9vaHdtb2dteHRwb3V6eWd1aWt0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzEwODgxMzgsImV4cCI6MjA4NjY2NDEzOH0.Qysof7Q9VNLGt2mX1ha9qoIm4BDdFSY6rAAbF5Bf588';

// Inicializar cliente de Supabase usando la librería del CDN
const { createClient } = supabase;
const supabaseClient = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
