-- Creación de la base de datos

CREATE DATABASE if not exists pequeños_aventureros;

USE pequeños_aventureros;

-- Tabla de usuarios

CREATE TABLE usuarios (

id_usuario INT AUTO_INCREMENT PRIMARY KEY,

nombre VARCHAR(100),

email VARCHAR(100) UNIQUE,

fecha_registro DATE,

tipo_usuario ENUM('padre', 'tutor') NOT NULL
);

-- Tabla de categorías

CREATE TABLE categorias (

id_categoria INT AUTO_INCREMENT PRIMARY KEY,

nombre_categoria VARCHAR(100)
);

-- Tabla de productos (juegos educativos)

CREATE TABLE productos (

id_producto INT AUTO_INCREMENT PRIMARY KEY,

nombre_producto VARCHAR(100),

descripcion TEXT,

id_categoria INT, 

FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Tabla de opiniones

CREATE TABLE opiniones (

id_opinion INT AUTO_INCREMENT PRIMARY KEY,

calificacion INT CHECK(calificacion >= 1 AND calificacion <= 5),

comentario varchar(100),

fecha_opinion DATE,

id_usuario int,

id_producto int,

FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),

FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Inserción de Datos:

-- Inserción de datos en la tabla categorías

INSERT INTO categorias VALUES

(10, 'aprendizaje temprano'),

(20, 'creatividad'),

(30, 'resolución de problemas');

-- Inserción de datos en la tabla usuarios

INSERT INTO usuarios  VALUES

(1, 'María López', 'maria.lopez@example.com', '2023-01-15', 'padre'),

(2, 'Juan Pérez', 'juan.perez@example.com', '2023-02-10', 'padre'),

(3, 'Ana Rodríguez', 'ana.rodriguez@example.com', '2023-03-22', 'tutor');

-- Inserción de datos en la tabla productos

INSERT INTO productos VALUES

(100, 'Aventuras del Alfabeto', 'Juego para aprender las letras del alfabeto', 10),

(200, 'Números Mágicos', 'Juego para aprender los números', 10),

(300, 'Colores y Formas', 'Juego para reconocer y diferenciar colores y formas', 10),

(400, 'Cuentos Fantásticos', 'Juego para crear historias creativas', 20),

(500, 'Arte y Diseño', 'Juego para fomentar la creatividad a través del dibujo y la pintura', 20),

(600, 'Desafíos del Castillo', 'Juego para mejorar habilidades de lógica', 30),

(700, 'Aventura en la Selva', 'Desafíos interactivos que requieren pensamiento crítico', 30);

-- Inserción de datos en la tabla opiniones

INSERT INTO opiniones VALUES

(1, 5, 'A mi hijo le encantó, aprendió todas las letras', '2023-02-01', 1, 100),

(2, 4, 'Buen juego, aunque podrían agregar más niveles', '2023-02-20', 2, 400),

(3, 5, 'Muy educativo, a los niños les encantan los desafíos', '2023-03-10', 3 ,300);