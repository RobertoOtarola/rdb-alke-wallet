# Proyecto: Alke Wallet

## Descripción
Diseño e implementación de una base de datos relacional para gestionar el sistema de una billetera virtual (Alke Wallet). Este proyecto permite a los usuarios almacenar fondos, gestionar transacciones y visualizar su historial financiero.

## Tecnologías Utilizadas
* Motor de Base de Datos: PostgreSQL
* Cliente SQL: DBeaver
* Control de Versiones: Git

## Estructura de la Base de Datos
El modelo se compone de tres entidades principales con sus respectivas relaciones y restricciones de integridad:
1. **Usuario:** Almacena la información de los clientes y su saldo actual.
2. **Moneda:** Define las divisas soportadas por la plataforma.
3. **Transacción:** Registra el flujo de fondos entre usuarios remitentes y receptores.

## Instrucciones de Ejecución
1. Abrir DBeaver y conectar a la instancia local de PostgreSQL.
2. Ejecutar la primera línea del archivo `AlkeWallet.sql` para crear la base de datos.
3. Seleccionar la nueva base de datos como base de datos activa.
4. Ejecutar el resto del script para crear las tablas, insertar los datos de prueba y visualizar las consultas.
