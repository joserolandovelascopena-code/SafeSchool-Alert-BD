-- CREACIÓN DEL USUARIO SafeSchool

 CREATE USER safeschool_user
 WITH PASSWORD 'CAMBIAR_POR_OTRA_PASS';


-- ASIGNAR PERMISOS DE CONEXIÓN Y USO DEL ESQUEMA
 
 GRANT CONNECT ON
 DATABASE safeschool_alert
 TO safeschool_user;

 GRANT USAGE ON
 SCHEMA public
 TO safeschool_user;

-- ASIGNAR PRIVILEGIOS CRUD

 GRANT SELECT, INSERT, UPDATE, DELETE
 ON ALL TABLES IN SCHEMA public
 TO safeschool_user;

 SELECT 
   grantee,  
   table_name, 
   privilege_type 
 
 FROM information_schema.role_table_grants
 WHERE grantee = 'safeschool_user';
 
-- REVOCAR PRIVILEGIOS

 REVOKE DELETE ON ALL
 TABLES IN SCHEMA public
 FROM safeschool_user

 