-- =====================================================
-- Proyecto: analisis-contrataciones-publicas
-- Archivo:  00_crear_base_y_schema.sql
-- Objetivo: realizar un analisis de las contraciones publicas de diciembre del año 2025 
-- =====================================================

-- Creación de la base de datos
-- Ejecutar conectado a: postgres
CREATE DATABASE  analisis_contrataciones_publicas; 
-- schema staging para guardar los dartos crudos
-- Ejecutar conectado a: analisis_contrataciones_publicas
CREATE SCHEMA IF NOT EXISTS staging; 
-- Ejecutar conectado a: analisis_contrataciones_publicas
-- schema datos, donde van los datos limpios
CREATE SCHEMA IF NOT EXISTS clean;  