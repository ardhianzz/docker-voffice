-- NOTE: 
-- untuk restore dari database production 
-- perlu membuat role "postgres", dengan atribut:
-- postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS
CREATE ROLE postgres WITH 
    SUPERUSER
    CREATEDB
    CREATEROLE
    REPLICATION
    BYPASSRLS
    LOGIN
    PASSWORD 'rote_password';

-- Membuat database
CREATE DATABASE dev_vo_master;
CREATE DATABASE dev_vo_esurat;
CREATE DATABASE dev_vo_elembur;
CREATE DATABASE dev_vo_ecuti;
CREATE DATABASE dev_vo_ereimburse;
CREATE DATABASE dev_vo_elpd;

-- Membuat schema 'sys' dan 'trs' untuk setiap database
\c dev_vo_master
CREATE SCHEMA sys;
CREATE SCHEMA trs;

\c dev_vo_esurat
CREATE SCHEMA sys;
CREATE SCHEMA trs;

\c dev_vo_elembur
CREATE SCHEMA sys;
CREATE SCHEMA trs;

\c dev_vo_ecuti
CREATE SCHEMA sys;
CREATE SCHEMA trs;

\c dev_vo_ereimburse
CREATE SCHEMA sys;
CREATE SCHEMA trs;

\c dev_vo_elpd
CREATE SCHEMA sys;
CREATE SCHEMA trs;