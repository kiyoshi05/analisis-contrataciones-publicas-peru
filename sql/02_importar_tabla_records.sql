-- git add sql/En la tabla que cree, staging.records subo el csv records

--Procedimiento: pgAdmin → Import/Export, formato, codificación y encabezado

--Consulta para saber el numero de las filas que he subido 
SELECT COUNT(*) FROM staging.records -- Obtuve 8388 filas