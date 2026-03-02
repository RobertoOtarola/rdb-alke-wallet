-- DDL: Definición de la Base de Datos y Tablas

-- 1. Crear usuario, contraseña, base de datos y asignar privilegios en Terminal Bash
-- psql postgres -c "CREATE USER alkewallet_admin WITH PASSWORD 'admin123';"
-- psql postgres -c "CREATE DATABASE alkewallet OWNER alkewallet_admin;"
-- psql postgres -c "GRANT ALL PRIVILEGES ON DATABASE alkewallet TO alkewallet_admin;"

-- 2. Crear tabla Moneda
CREATE TABLE moneda (
    currency_id SERIAL PRIMARY KEY,
    currency_name VARCHAR(50) NOT NULL,
    currency_symbol VARCHAR(5) NOT NULL
);

SELECT * FROM moneda;

-- 3. Crear tabla Usuario
CREATE TABLE usuario (
    user_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    saldo NUMERIC(15, 2) DEFAULT 0.00 NOT NULL,
    currency_id INT REFERENCES moneda(currency_id) ON DELETE SET NULL
);

SELECT * FROM usuario;

-- 4. Crear tabla Transacción
CREATE TABLE transaccion (
    transaction_id SERIAL PRIMARY KEY,
    sender_user_id INT REFERENCES usuario(user_id) ON DELETE CASCADE,
    receiver_user_id INT REFERENCES usuario(user_id) ON DELETE CASCADE,
    importe NUMERIC(15, 2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    currency_id INT REFERENCES moneda(currency_id) ON DELETE RESTRICT
);

SELECT * FROM transaccion;

-- DML: Inserción de Datos de Prueba

INSERT INTO moneda (currency_name, currency_symbol) VALUES
('Peso Chileno', 'CLP'),
('Dólar Estadounidense', 'USD');

INSERT INTO usuario (nombre, correo_electronico, contraseña, saldo, currency_id) VALUES
('Ada Lovelace', 'ada@example.com', 'hash123', 500000.00, 1),
('Alan Turing', 'alan@example.com', 'hash456', 1500.00, 2);

INSERT INTO transaccion (sender_user_id, receiver_user_id, importe, currency_id) VALUES
(1, 2, 25000.00, 1),
(2, 1, 50.00, 2);

-- DQL y DML: Consultas y Modificaciones Requeridas

-- Consulta para obtener el nombre de la moneda elegida por un usuario específico (ej. Usuario 1)
SELECT u.nombre, m.currency_name 
FROM usuario u
JOIN moneda m ON u.currency_id = m.currency_id
WHERE u.user_id = 1;

-- Consulta para obtener todas las transacciones registradas
SELECT * FROM transaccion;

-- Consulta para obtener todas las transacciones realizadas por un usuario específico (ej. Usuario 1 como remitente)
SELECT * FROM transaccion WHERE sender_user_id = 1;

-- Sentencia DML para modificar el campo correo electrónico de un usuario específico
UPDATE usuario 
SET correo_electronico = 'ada.lovelace@newdomain.com' 
WHERE user_id = 1;

-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)
DELETE FROM transaccion WHERE transaction_id = 2;
