-- Catálogo de desarrollo: actualiza o crea las películas 1, 2 y 3.
-- Reemplaza sus datos conservando los IDs y las demás películas.
USE cinego;

INSERT INTO peliculas
  (id, titulo, duracion, clasificacion, sinopsis, poster_url)
VALUES
  (
    1,
    'La odisea',
    150,
    18,
    'Una epopeya mitológica que sigue la historia de Odiseo y su largo viaje a casa, de 10 años de duración, tras la guerra de Troya.',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnYKwLld4fwjRJ0SdxGc_WPNnZm9zUhL8WxEB7_6QUmQ&s=10'
  ),
  (
    2,
    'Spiderman: brand new day',
    105,
    14,
    'Tras el éxito mundial sin precedentes de Spider-Man: Sin regreso a casa, Spider-Man: Un nuevo día marca un capítulo completamente nuevo para Peter Parker y Spider-Man. Han pasado cuatro años desde los acontecimientos de Sin regreso a casa, y Peter ahora es un adulto que vive completamente solo, habiéndose borrado voluntariamente de la vida y los recuerdos de sus seres queridos.',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV4Ymhbyu4rSv8b7zluLsjzjkvZ4DtLXOjbp_OR-Rx2A&s=10'
  ),
  (
    3,
    'Dune: Part 3',
    130,
    18,
    'Duna: Parte Tres se ambienta casi dos décadas después de que Paul Atreides tomó el control del Imperio. Convertido ahora en un despiadado Emperador, Paul deberá enfrentar las consecuencias de su reinado a medida que regresan viejos aliados, surgen aterradoras amenazas nuevas y la traición acecha en cada sombra.',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn6zu1u7Xudb3SG7pMkMZvIguVLOGU-JSs6Jd6FWZ9XA&s=10'
  ) AS nueva
ON DUPLICATE KEY UPDATE
  titulo = nueva.titulo,
  duracion = nueva.duracion,
  clasificacion = nueva.clasificacion,
  sinopsis = nueva.sinopsis,
  poster_url = nueva.poster_url;
