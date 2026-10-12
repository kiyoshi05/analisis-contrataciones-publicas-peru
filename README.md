# Análisis de contrataciones públicas del Perú (diciembre 2025)

Análisis de los **8 388 procesos de contratación** que el Estado peruano convocó en diciembre de 2025, usando **SQL (PostgreSQL)** sobre datos abiertos oficiales del OECE. El objetivo es entender **quién compra, qué compra, cuánto gasta y con cuánta competencia**.

## Hallazgos principales

- **Las obras concentran el dinero:** son solo el **14 %** de los procesos, pero el **55.7 %** del monto convocado (S/ 8 299 millones de un total de S/ 14 894 millones). Una obra cuesta en promedio S/ 7.1 millones, frente a S/ 0.6 millones de una compra de bienes.
- **Un tercio de los procesos tuvo poca competencia:** **2 660 de 7 868 procesos (33.8 %)** tuvieron menos de 5 postores, y **929** tuvieron **uno solo**. La mitad de estos últimos (474) son **contrataciones directas**, donde la ley permite contratar sin competencia.
- **Más procesos no significa más dinero:** el **Seguro Social de Salud (EsSalud)** es la entidad que más procesos convocó (**441**), pero **Provías Nacional (MTC)** es la de mayor monto (**S/ 1 815 millones** en 105 procesos).
- **Las grandes obras de infraestructura atraen a más postores:** los procesos con más competencia (hasta **167 postores**) son obras viales del **Fondo Metropolitano de Inversiones** y de **Provías Descentralizado**.
- **El método más usado no es el que mueve más dinero:** la **Licitación Pública Abreviada** es la más usada (2 525 procesos), pero la **Licitación Pública** concentra el **38.9 %** del monto con solo 720 procesos.

## Preguntas de negocio

### 1. ¿Cuáles son los 10 procesos con más postores? ¿Cuántos tuvieron menos de 5?

| Postores | Entidad | Categoría |
|---|---|---|
| 167 | Fondo Metropolitano de Inversiones | Obras |
| 167 | Fondo Metropolitano de Inversiones | Obras |
| 167 | Fondo Metropolitano de Inversiones | Obras |
| 148 | MTC - Provías Descentralizado | Obras |
| 138 | MTC - Provías Descentralizado | Obras |
| 130 | MTC - Provías Descentralizado | Obras |
| 128 | Fondo Metropolitano de Inversiones | Obras |
| 124 | MTC - Provías Descentralizado | Obras |
| 117 | Gobierno Regional de Áncash - Sub Región Pacífico | Obras |
| 116 | MTC - Provías Descentralizado | Obras |

Los 10 son **obras de infraestructura vial**. En el otro extremo, **2 660 procesos (33.8 %)** tuvieron menos de 5 postores y **929** tuvieron uno solo, sobre todo **servicios** (575) y **bienes** (315). La mediana es de **8 postores** por proceso.

### 2. ¿Cuáles son los 10 procesos con mayor monto estimado?

| Monto estimado (S/) | Entidad | Categoría |
|---|---|---|
| 615 795 125.40 | MTC - Provías Nacional | Obras |
| 522 282 562.45 | MTC - Provías Nacional | Obras |
| 522 282 562.45 | MTC - Provías Nacional | Obras |
| 374 704 484.50 | MTC - Provías Descentralizado | Servicios |
| 200 632 580.83 | Gobierno Regional de Áncash - Sede Central | Obras |
| 192 319 950.67 | Ministerio de Justicia y Derechos Humanos | Obras |
| 186 895 641.85 | Dirección General de Electrificación Rural (MINEM) | Obras |
| 155 731 383.51 | Universidad Nacional San Antonio Abad del Cusco | Obras |
| 117 721 070.49 | SEDAPAL | Servicios |
| 97 560 975.65 | Instituto Peruano del Deporte | Servicios |

El mayor proceso (S/ 615.8 millones) es el diseño y la construcción de un **puente** de Provías Nacional. Siete de los diez son **obras**; los servicios del top son de conservación vial, seguros y tecnología. En el otro extremo hay servicios desde S/ 1 600, lo que muestra la enorme dispersión de los montos.

### 3. ¿Qué entidades convocaron más procesos y por cuánto en total?

**Por cantidad de procesos:**

| Entidad | Procesos | Monto total (S/) |
|---|---|---|
| Seguro Social de Salud (EsSalud) | 441 | 609 758 961 |
| Municipalidad Distrital de San Marcos | 115 | 186 897 765 |
| Gobierno Regional de Puno - Sede Central | 108 | 214 684 055 |
| MTC - Provías Nacional | 105 | 1 815 107 155 |
| Gobierno Regional de Cusco - Sede Central | 96 | 31 693 606 |

**Por monto total:**

| Entidad | Procesos | Monto total (S/) |
|---|---|---|
| MTC - Provías Nacional | 105 | 1 815 107 155 |
| MTC - Provías Descentralizado | 38 | 726 839 820 |
| Seguro Social de Salud (EsSalud) | 441 | 609 758 961 |
| Gobierno Regional de Pasco - Sede Central | 41 | 378 489 361 |
| Gobierno Regional de Ucayali - Sede Central | 46 | 373 710 595 |

EsSalud convoca muchos procesos de monto moderado (compras recurrentes de un sistema de salud), mientras que Provías Nacional convoca menos procesos, pero de gran tamaño (infraestructura). En total compraron **1 450 entidades** distintas.

### 4. ¿Cuánto dinero se convocó por categoría?

| Categoría | Procesos | % de procesos | Monto total (S/) | % del monto |
|---|---|---|---|---|
| Obras (`works`) | 1 171 | 14.0 % | 8 299 054 554.81 | **55.7 %** |
| Servicios (`services`) | 3 566 | 42.5 % | 4 242 242 691.05 | 28.5 % |
| Bienes (`goods`) | 3 651 | 43.5 % | 2 352 525 618.56 | 15.8 % |

Los bienes y servicios son la mayoría de los procesos, pero las obras se llevan más de la mitad del dinero.

### 5. ¿Qué métodos se usan más y con qué monto promedio?

| Método | Procesos | Monto promedio (S/) | % del monto |
|---|---|---|---|
| Licitación Pública Abreviada | 2 525 | 839 470 | 14.2 % |
| Concurso Público Abreviado | 2 077 | 313 146 | 4.4 % |
| Licitación Pública | 720 | 8 039 197 | **38.9 %** |
| Subasta Inversa Electrónica | 619 | 676 717 | 2.8 % |
| Comparación de Precios | 612 | 77 842 | 0.3 % |
| Contratación Directa | 560 | 1 926 617 | 7.2 % |
| Concurso Público de Servicios | 547 | 3 973 334 | 14.6 % |

El método más usado es la **Licitación Pública Abreviada**, pero la **Licitación Pública**, con un promedio de S/ 8 millones por proceso, concentra la mayor parte del dinero. La **Comparación de Precios** se reserva para compras pequeñas (S/ 78 mil en promedio).

## Calidad de los datos

- **520 procesos (6.2 %) no tienen número de postores.** La hipótesis inicial era que se trataba de contrataciones directas sin competencia, pero **se descartó**: la Contratación Directa tiene solo 8.6 % de vacíos, y en los métodos con más de 100 procesos el porcentaje va de 3.4 % a 12.9 %. Hipótesis pendiente: procesos que no llegaron a la etapa de ofertas.
- **Montos en tres monedas** (soles, dólares y euros). Para comparar se usa el monto convertido a soles (`monto_estimado_pen`).
- **Montos repetidos:** dos procesos de Provías Nacional tienen exactamente el mismo monto (S/ 522 282 562.45) y la misma obra, lo que sugiere una **reconvocatoria**. Conviene revisarlo antes de sumar montos por obra.
- `ocid` es la **clave**: los 8 388 valores son únicos.

## Datos

- **Fuente:** [Portal de Contrataciones Abiertas del OECE](https://contratacionesabiertas.oece.gob.pe/descargas), estándar OCDS (SEACE v3), procesos convocados en **diciembre de 2025**.
- **Tamaño:** 8 388 procesos (archivo `records.csv`).
- Los archivos **no están en el repositorio** por su tamaño. Para reproducir el análisis, descarga el CSV de diciembre de 2025 (SEACE v3) desde el portal y descomprímelo en `data/raw/`.

## Metodología

| Paso | Script | Qué se hizo |
|---|---|---|
| 1 | [`docs/01_exploracion_records.md`](docs/01_exploracion_records.md) | Exploración inicial en Excel y con el diccionario de datos |
| 2 | [`sql/00_crear_base_y_schema.sql`](sql/00_crear_base_y_schema.sql) | Base de datos y esquemas `staging` (crudo) y `clean` (limpio) |
| 3 | [`sql/01_crear_staging_records.sql`](sql/01_crear_staging_records.sql) | Tabla staging con las 39 columnas como `TEXT` |
| 4 | [`sql/02_importar_tabla_records.sql`](sql/02_importar_tabla_records.sql) | Carga del CSV y verificación (8 388 filas) |
| 5 | [`sql/03_perfilado.sql`](sql/03_perfilado.sql) | Perfilado: clave, valores vacíos y categorías |
| 6 | [`sql/04_crear_clean_procesos.sql`](sql/04_crear_clean_procesos.sql) | Tabla limpia `clean.procesos`: 11 columnas, nombres en español y tipos correctos |
| 7 | [`sql/05_analisis.sql`](sql/05_analisis.sql) | Respuesta a las 5 preguntas de negocio |

## Estructura del repositorio

```
analisis-contrataciones-publicas-peru/
├── data/raw/      ← CSV originales (no se suben a GitHub)
├── docs/          ← notas de exploración
├── sql/           ← scripts numerados en orden de ejecución
└── README.md
```

## Herramientas

PostgreSQL 16 · pgAdmin 4 · Git y GitHub · Excel (exploración inicial)
