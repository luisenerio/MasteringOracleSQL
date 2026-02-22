Para obtener los formatos de fechas, lenguage, region:

```sql
SELECT
    SYS_CONTEXT('USERENV','NLS_DATE_FORMAT')   AS NLS_DATE_FORMAT,
    SYS_CONTEXT('USERENV','NLS_DATE_LANGUAGE') AS NLS_DATE_LANGUAGE,
    SYS_CONTEXT('USERENV','NLS_TERRITORY')     AS NLS_TERRITORY
FROM dual;
```

Para cambiar durante la sesión:

```
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-RR';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
```

Para conectar al entrar a sqlplus, se recomienda crear las tablas en xepdb1 (plugable database)
sqlplus system/tercosXsiempre123@localhost:1521/xepdb1


Para revisar a que base estas conectado
```
SHOW USER
SHOW CON_NAME

SELECT
  SYS_CONTEXT('USERENV','DB_NAME')        AS db_name,
  SYS_CONTEXT('USERENV','SERVICE_NAME')   AS service_name,
  SYS_CONTEXT('USERENV','INSTANCE_NAME')  AS instance_name,
  SYS_CONTEXT('USERENV','SERVER_HOST')    AS server_host
FROM dual;

SELECT COUNT(*) AS customer_rows FROM system.customer;
```

