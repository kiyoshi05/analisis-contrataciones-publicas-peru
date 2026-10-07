# Exploración de records.csv

## 1. ¿Qué es una fila?

Cada fila es un/una: Registro del proceso de contratación o licitación pública en sí mismo

Clave (columna que no se repite): Ninguna columna se repite, cada columna parece ser un paso de del proceso de licitación o contratación
¿Lo comprobaste? ...

## 2. Tamaño

Filas: 8388

Columnas: 39

## 3. Columnas importantes

| Columna | Qué significa (con mis palabras) | Tipo (texto/número/fecha) | ¿Tiene vacíos? |
|---|---|---|---|
| tender/mainProcurementCategory |La principal categoría describiendo el objeto principal de este proceso de contrataciones, de la lista de código cerrada procurementCategory. |string|  |
| tender/value/amount | Valor estimados en dinero, de la covocatoria | float |  |
| buyer/name | Eentidad publica que solicita la obra o el bien | string | |
| tender/procurementMethodDetails | Los detalles del metodo de adquisicion | string | hasta donde he observado, no tiene, pero podriamos someterlo a un análisis |
| tender/numberOfTenderers | Número de postores que se presentaron a esa licitación | integer |  |
| tender/datePublished | Día de la publicación de la licitación | date |  |

## 4. Cosas raras que encontré
compiledRelease/tender/tenderPeriod/durationInDays
compiledRelease/tender/tenderPeriod/durationInDays

Son columnas vacías
- ...

## 5. Preguntas de negocio que me gustaría responder

1. ¿Cuales son los procesos de licitaciones con más postores y licitaciones con menos de 5 postores?
2. ¿Cuales son las licitaciones con mayor valor estimado de la convocatoria (tender/value/amount)?
3. Entidades con mayor cantidad de licitaciones con el presupuesto de cada una.
