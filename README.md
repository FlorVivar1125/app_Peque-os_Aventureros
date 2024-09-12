## **App_Pequeños_Aventureros** ##
Estamos enfocadas en estimular el aprendizaje temprano, la creatividad y la resolución de problemas en un entorno seguro y entretenido para niños pequeños. Nuestra aplicación ofrece una variedad de juegos interactivos diseñados para fomentar el desarrollo cognitivo, emocional y social de los niños.

## **Características:** ##

- Juegos educativos.

- Actividades creativas.

- Resolución de problemas....

- Entorno seguro.

![image](https://github.com/FlorVivar1125/app_Peque-os_Aventureros/assets/168501110/bc11d6ae-5d02-46b1-837a-c7b8f9c84ffe)

## **Catálogo de productos:** ##

## **Juegos de aprendizaje temprano:**
Aventuras del alfabeto: Un juego interactivo que enseña las letras del alfabeto a través de canciones y actividades divertidas.

Números mágicos: Ayuda a los niños a aprender los números y a contar con la ayuda de personajes mágicos.

Colores y formas: Un juego que enseña a los niños a reconocer y diferenciar colores y formas a través de actividades creativas.

## **Juegos de creatividad:**
Cuentos fantásticos: Permite a los niños crear sus propias historias utilizando una amplia variedad de personajes y escenarios.

Arte y diseño: Un juego que fomenta la creatividad a través del dibujo y la pintura virtual.

## **Juegos de resolución de problemas:**

Desafíos del castillo: Juegos de rompecabezas que ayudan a mejorar las habilidades de lógica y resolución de problemas.

Aventura en la selva: Desafíos interactivos que requieren pensamiento crítico para resolver problemas y avanzar en la historia.

## **Modelo Lógico**
![image](https://github.com/FlorVivar1125/app_Peque-os_Aventureros/assets/168501110/a9337029-c753-45f8-b7cf-d7f692bca716)

## Tablas principales
Usuarios: Información sobre los usuarios (padres o tutores) que se registran en la aplicación.

Productos: Almacena información sobre los juegos educativos disponibles en la aplicación.

Categorías: Almacena las diferentes categorías en las que se pueden clasificar los productos (juegos educativos).

Opiniones: Almacena las opiniones y calificaciones de los usuarios sobre los productos (juegos educativos).

## ***Estructura de la Base de Datos y Scripts en MySQL para Pequeños Aventureros***

**Creación de la Base de Datos y Tablas**

-- Creación de la base de datos

CREATE DATABASE pequenios_aventureros;

USE pequenios_aventureros;

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
    
    categoria_id INT,
    
    FOREIGN KEY (categoria_id) REFERENCES categorias(id_categoria)

);

-- Tabla de opiniones (reviews de los productos)

CREATE TABLE opiniones (

    id_opinion INT AUTO_INCREMENT PRIMARY KEY,
    
    id_usuario INT,
    
    id_producto INT,
    
    calificacion INT CHECK(calificacion >= 1 AND calificacion <= 5),
    
    comentario TEXT,
    
    fecha_opinion DATE,
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
   
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)

);

**Inserción de Datos:**

-- Inserción de datos en la tabla categorías

INSERT INTO categorias (nombre_categoria) VALUES 

('aprendizaje temprano'),

('creatividad'),

('resolución de problemas');

-- Inserción de datos en la tabla usuarios

INSERT INTO usuarios (nombre, email, fecha_registro, tipo_usuario) VALUES

('María López', 'maria.lopez@example.com', '2023-01-15', 'padre'),

('Juan Pérez', 'juan.perez@example.com', '2023-02-10', 'padre'),

('Ana Rodríguez', 'ana.rodriguez@example.com', '2023-03-22', 'tutor');

-- Inserción de datos en la tabla productos

INSERT INTO productos (nombre_producto, descripcion, categoria_id) VALUES

('Aventuras del Alfabeto', 'Juego para aprender las letras del alfabeto', 1),

('Números Mágicos', 'Juego para aprender los números', 1),

('Colores y Formas', 'Juego para reconocer y diferenciar colores y formas', 1),

('Cuentos Fantásticos', 'Juego para crear historias creativas', 2),

('Arte y Diseño', 'Juego para fomentar la creatividad a través del dibujo y la pintura', 2),

('Desafíos del Castillo', 'Juego para mejorar habilidades de lógica', 3),

('Aventura en la Selva', 'Desafíos interactivos que requieren pensamiento crítico', 3);

-- Inserción de datos en la tabla opiniones

INSERT INTO opiniones (id_usuario, id_producto, calificacion, comentario, fecha_opinion) VALUES

(1, 1, 5, 'A mi hijo le encantó, aprendió todas las letras', '2023-02-01'),

(2, 2, 4, 'Buen juego, aunque podrían agregar más niveles', '2023-02-20'),

(3, 4, 5, 'Muy educativo, a los niños les encantan los desafíos', '2023-03-10');


## **Reportes del Problema**

Consulta 1: Productos y sus Categorías

Objetivo: Mostrar todos los productos junto con su categoría.

SELECT nombre_producto,


(SELECT nombre_categoria

FROM categorias

WHERE id_categoria = productos.categoria_id) AS Categoria,

descripcion FROM productos;


## **Beneficios de la Aplicación**

La aplicación Pequeños Aventureros ofrece múltiples beneficios tanto para los niños como para los padres. Estos incluyen:

Desarrollo Integral: Los juegos están diseñados para fomentar el desarrollo cognitivo, emocional y social de los niños, ayudándolos a adquirir habilidades importantes desde una edad temprana.

Interactividad: La aplicación proporciona un entorno interactivo donde los niños pueden aprender jugando, lo que aumenta la retención de conocimientos y hace que el aprendizaje sea una experiencia divertida.

Monitoreo Parental: Los padres pueden seguir el progreso de sus hijos a través de la aplicación, permitiéndoles ver en qué áreas destacan y en cuáles podrían necesitar más apoyo.

Seguridad: La aplicación asegura un entorno seguro para los niños, protegiendo su información personal y garantizando que el contenido sea apropiado para su edad.


## **Funcionalidades Clave**

Pequeños Aventureros incluye una serie de funcionalidades diseñadas para maximizar la experiencia educativa de los usuarios:

Personalización: La aplicación se adapta al nivel de cada niño, ajustando la dificultad de los juegos según su progreso.

Recompensas: Los niños pueden ganar recompensas y desbloquear nuevos contenidos al completar juegos y desafíos, lo que los motiva a seguir aprendiendo.

Contenido Actualizado: La aplicación se actualiza regularmente con nuevos juegos y actividades, asegurando que siempre haya algo nuevo y emocionante para los niños.

Acceso Multiplataforma: Disponible en varios dispositivos, incluidos teléfonos inteligentes y tabletas, permitiendo que los niños puedan jugar y aprender en cualquier lugar.


## **Opiniones de los Usuarios**

Las opiniones y comentarios de los usuarios son fundamentales para el desarrollo continuo de Pequeños Aventureros. A continuación, se presentan algunas opiniones destacadas:

María López: "Mis hijos aman la aplicación. No solo se divierten, sino que he notado una gran mejora en su conocimiento del alfabeto y los números."

Juan Pérez: "Es una herramienta increíble para padres ocupados. Sé que mis hijos están aprendiendo algo valioso mientras juegan."

Ana Rodríguez: "La sección de creatividad es su favorita. Les encanta crear sus propias historias, y yo me siento segura de que están en un entorno apropiado."

## **Futuras Actualizaciones**

Pequeños Aventureros sigue evolucionando con el tiempo. Algunas de las características que se están planificando para futuras versiones incluyen:

Multijugador: Integración de una función multijugador que permitirá a los niños jugar y aprender junto a sus amigos o familiares en tiempo real.

Nuevas Categorías: Expansión de las categorías de juegos para incluir temas como ciencias, historia y geografía, ofreciendo un aprendizaje más amplio y diverso.

Realidad Aumentada (AR): Implementación de tecnologías de realidad aumentada para hacer que los juegos sean aún más inmersivos y atractivos.


## ***Conclusión***

La aplicación Pequeños Aventureros se ha convertido en una herramienta esencial para el aprendizaje temprano de los niños, combinando educación y entretenimiento en un solo lugar.
Con su enfoque en la seguridad, personalización y continua innovación, se asegura de que los niños no solo se diviertan, sino que también desarrollen habilidades esenciales para su futuro.


