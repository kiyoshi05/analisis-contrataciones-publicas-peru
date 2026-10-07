-- =====================================================
-- Proyecto: analisis-contrataciones-publicas
-- Archivo:  00_crear_base_y_schema.sql
-- Objetivo: crea el la database y crea dos schemas
-- =====================================================

-- Creación de la base de datos
CREATE DATABASE analisis_contrataciones_publicas; 
-- Creo un schema staging para limpiar datos (datos crudos)
CREATE SCHEMA staging; 
-- Creo un schema datos para limpiar datos (datos crudos)
CREATE SCHEMA clean;  