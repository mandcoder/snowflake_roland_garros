USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS api_dlt_role;

GRANT ROLE api_dlt_role TO USER api_extractor;

GRANT ROLE api_dlt_role TO USER mander;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE api_dlt_role;

GRANT USAGE ON DATABASE roland_2025 TO ROLE api_dlt_role;

GRANT USAGE ON SCHEMA roland_2025.staging TO ROLE api_dlt_role;

GRANT USAGE ON SCHEMA roland_2025.sportsapi365 TO ROLE api_dlt_role;

GRANT USAGE ON SCHEMA sportsapi365_staging TO ROLE api_dlt_role;

GRANT CREATE TABLE ON SCHEMA sportsapi365_staging TO ROLE api_dlt_role;

GRANT CREATE TABLE ON SCHEMA roland_2025.sportsapi365 TO api_dlt_role;

GRANT CREATE TABLE ON SCHEMA roland_2025.staging TO api_dlt_role;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA roland_2025.staging TO ROLE api_dlt_role;

GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA roland_2025.staging TO ROLE api_dlt_role;

SHOW GRANTS ON SCHEMA roland_2025.staging;

SHOW ROLES LIKE 'TENNIS_DLT_ROLE';

SHOW GRANTS TO ROLE api_dlt_role;