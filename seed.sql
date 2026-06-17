-- ═══════════════════════════════════════════════════════════════════
-- RetornaCírculo · Datos de demostración
-- Ejecutar en Supabase SQL Editor después del schema.sql
-- ═══════════════════════════════════════════════════════════════════

-- Empresas piloto
INSERT INTO empresas (rut, razon_social, tipo, region, retc_codigo, sig_id) VALUES
('76.543.210-9', 'Distribuidora Andes del Sur Ltda.',  'DISTRIBUIDOR', 'Valparaíso', 'RETC-VAL-001', 'GIRO-CH-041'),
('77.891.234-5', 'Envases Pacífico S.A.',               'PRODUCTOR',    'Valparaíso', 'RETC-VAL-002', 'GIRO-CH-042'),
('76.112.345-6', 'Cervecera Valparaíso SpA.',           'PRODUCTOR',    'Valparaíso', 'RETC-VAL-003', 'GIRO-CH-043'),
('78.234.567-8', 'Importadora Costa Central Ltda.',     'IMPORTADOR',   'Valparaíso', 'RETC-VAL-004', 'GIRO-CH-044'),
('79.345.678-9', 'Retail Marga Marga S.A.',             'DISTRIBUIDOR', 'Valparaíso', 'RETC-VAL-005', 'GIRO-CH-045')
ON CONFLICT (rut) DO NOTHING;

-- Puntos de retorno
INSERT INTO puntos_retorno (nombre, tipo, empresa_id, latitud, longitud, region, materiales, capacidad_kg) VALUES
('RVM Centro Valparaíso',      'RVM',          1, -33.047200, -71.612700, 'Valparaíso', ARRAY['PET','VIDRIO','METAL'],           500.00),
('Centro Acopio Viña del Mar', 'CENTRO_ACOPIO',2, -33.024000, -71.551500, 'Valparaíso', ARRAY['PET','VIDRIO','CARTON','METAL'], 2000.00),
('RVM Mall Marina Viña',       'RVM',          3, -33.018900, -71.544200, 'Valparaíso', ARRAY['PET','METAL'],                    300.00),
('Punto Móvil Quilpué',        'MOVIL',        4, -33.049800, -71.442300, 'Valparaíso', ARRAY['PET','CARTON'],                   200.00)
ON CONFLICT DO NOTHING;

-- Ciclos REP 2026
INSERT INTO ciclos_rep (empresa_id, anio, fase, meta_retorno_pct, envases_total, envases_retorno, estado) VALUES
(1, 2026, 4, 40.00, 68412, 33055, 'ACTIVO'),
(2, 2026, 4, 40.00, 54201, 22826, 'ACTIVO'),
(3, 2026, 4, 40.00, 41880, 17047, 'ACTIVO'),
(4, 2026, 4, 40.00, 47022, 17633, 'ACTIVO'),
(5, 2026, 4, 40.00, 37102, 10908, 'ACTIVO')
ON CONFLICT (empresa_id, anio) DO NOTHING;
