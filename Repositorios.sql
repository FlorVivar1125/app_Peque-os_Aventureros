Use pequeños_aventureros;

/**Consulta 1:** Opiniones Detalladas por Usuario.

Objetivo: Mostrar todas las opiniones que ha hecho un usuario específico junto con el nombre del producto.*/

SELECT 

    (SELECT nombre 
    
    
     FROM usuarios 
     
     WHERE id_usuario = opiniones.id_usuario) AS Usuario, 
   
    (SELECT nombre_producto 
    
     FROM productos 
     
     WHERE id_producto = opiniones.id_producto) AS Producto, 
  
    comentario, 
    
    calificacion

FROM 

    opiniones
    
WHERE 
    
    id_usuario = (SELECT id_usuario 
    
                  FROM usuarios 
                  
                  WHERE nombre = 'María López');

/**Consulta 2:** Productos con Más Opiniones.

Objetivo: Mostrar todas las opiniones que ha hecho un usuario específico junto con el nombre del producto.*/

SELECT 


    nombre_producto, 
    
    (SELECT COUNT(*) 
    
     FROM opiniones 
     
     WHERE id_producto = productos.id_producto) AS Numero_de_Opiniones

FROM 

    productos

ORDER BY 

    Numero_de_Opiniones DESC;


/***Consulta 3**: Productos y sus Categorías

Objetivo: Mostrar todos los productos junto con su categoría.*/

SELECT nombre_producto,

(SELECT nombre_categoria

FROM categorias

WHERE id_categoria = productos.categoria_id) AS Categoria,

descripcion FROM productos;


/**Consulta 4:** Opiniones Promedio por Categoría

Objetivo: Mostrar la calificación promedio de los productos en cada categoría.*/

SELECT 
    nombre_categoria, 
    
    (SELECT AVG(calificacion) 
    
     FROM opiniones 
     
     WHERE id_producto IN 
     
         (SELECT id_producto 
         
          FROM productos 
          
          WHERE categoria_id = categorias.id_categoria)) AS Promedio_Calificacion

FROM 

    categorias;

