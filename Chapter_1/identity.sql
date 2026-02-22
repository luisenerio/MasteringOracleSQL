SHOW USER
SHOW CON_NAME

SELECT
  SYS_CONTEXT('USERENV','DB_NAME')        AS db_name,
  SYS_CONTEXT('USERENV','SERVICE_NAME')   AS service_name,
  SYS_CONTEXT('USERENV','INSTANCE_NAME')  AS instance_name,
  SYS_CONTEXT('USERENV','SERVER_HOST')    AS server_host
FROM dual;

SELECT COUNT(*) AS customer_rows FROM system.customer;