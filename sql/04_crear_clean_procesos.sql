--En esta seccion se crea una tabla clean_procesos que contiene los datos 
--tranformados (algunos, otros convervan su estructura inicial) con la 
--finalidad de poder hacer operaciones para responder las preguntas planteadas

DROP TABLE IF EXISTS clean.procesos;
CREATE TABLE clean.procesos AS 
SELECT
	ocid,
	release_buyername AS entidad, 
	release_tender_title AS titulo, 
	release_tender_description AS descripcion, 
	release_tender_mainprocurementcategory AS  categoria, 
	release_tender_procurementmethoddetails AS metodo, 
	release_tender_value_amount::NUMERIC AS monto_estimado, 
	release_tender_value_currency AS moneda, 
	release_tender_value_amount_pen::NUMERIC AS monto_estimado_pen,
	release_tender_numberoftenderers:: INTEGER AS numero_postores,
	release_tender_datepublished::TIMESTAMPTZ AS fecha_convocatoria
FROM staging.records;