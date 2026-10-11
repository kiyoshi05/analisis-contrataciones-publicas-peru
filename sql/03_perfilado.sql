-- En esta seccion vamos a explorar los en general y las columnas más importantes 
-- que definimos previamente, esto para obtener algunos insights
-- Para eso vamos a responder algunas preguntas

-- 1. ¿ocid es la clave?
SELECT COUNT(DISTINCT ocid) FROM staging.records -- me da 8388
-- Con el resultado puedo indicar que cada fila tiene un unico ocid y es la clave

-- 2. ¿Cuántos vacíos tiene cada columna importante?
SELECT 
	COUNT(*) AS total_filas,
	COUNT(*) - COUNT(release_tender_mainprocurementcategory) AS vacios_categoria,
	COUNT(*) - COUNT(release_tender_value_amount) AS vacios_value_amount,
	COUNT(*) - COUNT(release_buyername) AS vacios_buyername,
	COUNT(*) - COUNT(release_tender_procurementmethoddetails) AS vacios_procurementmethoddetails,
	COUNT(*) - COUNT(release_tender_numberoftenderers) AS numberoftenderers,
	COUNT(*) - COUNT(release_tender_datepublished) AS datepublished
FROM staging.records
-- Obtengo como resultado que la columna con el numero de licitaciones
--  tiene 520 vacias o con algun valor null.
-- con esto puedo tener como hipotesis que hay licitaciones que no han tenido postores

-- 3. ¿Cuántos procesos tiene cada categoría? de mayor a menor.
SELECT
    release_tender_mainprocurementcategory AS categoria,
    COUNT(*) AS total_procesos
FROM staging.records
GROUP BY release_tender_mainprocurementcategory
ORDER BY total_procesos DESC;
-- Hay en goods: 3651, services: 3566 y works: 1171, la mayoria son bienes y servicios

--Respondiedo mi hipotesis voy a averiguar que tieinen las 520 filas vacias
SELECT
    release_tender_procurementmethoddetails AS metodo,
    COUNT(*) AS total_procesos,
    COUNT(*) - COUNT(release_tender_numberoftenderers) AS sin_postores,
    ROUND(100.0 * (COUNT(*) - COUNT(release_tender_numberoftenderers)) / COUNT(*), 1) AS pct_sin_postores
FROM staging.records
GROUP BY release_tender_procurementmethoddetails
ORDER BY pct_sin_postores DESC;

--“520 procesos (6.2 %) no tienen número de postores. No se concentran en un
-- método: Contratación Directa tiene solo 8.6 % de vacíos. 
--Los porcentajes van de 3.4 % a 12.9 % en los métodos con más de 100 procesos.
-- Hipótesis pendiente: procesos que no llegaron a la etapa de ofertas.”