--En esta sección respondemos las siguientes preguntas:
--1. ¿Cuáles son los 10 procesos con más postores? ¿Cuántos tuvieron menos de 5?
--2. ¿Cuáles son los 10 procesos con mayor monto estimado?
--3. ¿Qué entidades convocaron más procesos y por cuánto en total?
--4. ¿Cuánto dinero se convocó por categoría?
--¿5. Qué métodos se usan más y con qué monto promedio?


--Respodiendo la pregunta 1

SELECT
	ocid,
    entidad,
    categoria,
    numero_postores
FROM clean.procesos
ORDER BY numero_postores DESC NULLS LAST
LIMIT 10;
-- Puedo concluir que la mayoria de postores estan en las obras del FONDO METROPOLITANO 
-- DE INVERSIONES y en MTC-PROYECTO ESPECIAL DE INFRAESTRUCTURA DE TRANSPORTE DESCENTRALIZADO
-- PROVIAS DESCENTRALIZADO,
-- Lo máximo de posteres por obras con 167 

SELECT
    ocid,
    entidad,
    categoria,
    numero_postores
FROM clean.procesos
WHERE numero_postores < 5          -- 1.º filtra
ORDER BY numero_postores           -- 2.º ordena (de menor a mayor)
LIMIT 10;                          -- 3.º se queda con 10
-- La cantidad con menos postores mínimo 1 postor y pertenecen a estas ID's para investigarlos a futuro
--"ocds-dgv273-seacev3-1178381"
--"ocds-dgv273-seacev3-1177629"
--"ocds-dgv273-seacev3-1183126"
--"ocds-dgv273-seacev3-1176773"
--"ocds-dgv273-seacev3-1181721"
--"ocds-dgv273-seacev3-1178778"
--"ocds-dgv273-seacev3-1179126"
--"ocds-dgv273-seacev3-1181047"
--"ocds-dgv273-seacev3-1250914"

--Respodiendo la pregunta 2
SELECT
	ocid,
    entidad,
    categoria,
    monto_estimado_pen
FROM clean.procesos
ORDER BY monto_estimado_pen DESC NULLS LAST 
LIMIT  10;

-- Hay works que alcanza los seicientos millones de soles
-- Hay servicios que van desde los 1600 soles


--Respodiendo la pregunta 3
SELECT
    entidad,
    COUNT(*) AS total_procesos,
    SUM(monto_estimado_pen) AS monto_total_pen
FROM clean.procesos
GROUP BY entidad
ORDER BY total_procesos DESC
LIMIT 20;

-- SEGURO SOCIAL DE SALUD es la entidad que mas procesos tiene, pero no la que mas
-- presupuesto tiene, MTC-PROYECTO ESPECIAL DE INFRAESTRUCTURA DE TRANSPORTE NACIONAL (PROVIAS NACIONAL)
-- es la entidad con mayor presupuesto

--Respondiendo la preguta 4
SELECT
    categoria,
    COUNT(*) AS total_categoria,
    SUM(monto_estimado_pen) AS monto_total_pen,
	ROUND(100.0 * SUM(monto_estimado_pen) / SUM(SUM(monto_estimado_pen)) OVER (), 1) AS pct_monto
	
FROM clean.procesos
GROUP BY categoria
ORDER BY monto_total_pen DESC
LIMIT 20;

-- Por categoria se convoco 8299054554.81 para works, 4242242691.05 services y 2352525618.56 para goods
-- La maoyor parte del monto esta en los works (55.7%), services (28.5%) y los goods(15.8%)

-- Respondiendo la pregunta 5 
SELECT
    metodo,
    COUNT(*) AS total_metodo,
    SUM(monto_estimado_pen) AS monto_total_pen,
	ROUND(100.0 * SUM(monto_estimado_pen) / SUM(SUM(monto_estimado_pen)) OVER (), 1) AS pct_monto
	
FROM clean.procesos
GROUP BY metodo
ORDER BY monto_total_pen DESC
LIMIT 20;

--El metodo que mas se utiliza es el Concurso Público Abreviado, sin embargo, el porcentaje 
-- mayor de monto en téminos de dinero pertenece a Licitación Pública