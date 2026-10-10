# CineGo

CineGo es una API backend para la gestión de un sistema de cine.
Permite administrar películas, salas y funciones de proyección.
También contempla usuarios, reservas, entradas, asientos y estados de reserva.
Incluye descuentos configurables y cálculo del precio final de las entradas.
Su alcance comprende la exposición de estos servicios mediante una API REST.

## Aspectos técnicos

- Desarrollado con Java 17 y Spring Boot.
- Persistencia mediante Spring Data JPA y MySQL.
- Seguridad gestionada con Spring Security.
- Documentación automática de endpoints con OpenAPI y Swagger UI.
- Construcción y ejecución mediante Maven Wrapper.

## Catálogo de películas de desarrollo

### Base nueva

Desde la raíz del repositorio, con Docker en ejecución:

```bash
docker compose up -d
```

Cuando el volumen de MySQL está vacío, Docker ejecuta `initdb/01-schema-and-seed.sql`.
El catálogo inicial incluye La odisea, Spiderman: brand new day y Dune: Part 3.
La duración se guarda en minutos y la clasificación representa la edad mínima.

### Base existente

Actualizar el repositorio o reiniciar Docker no vuelve a ejecutar el script inicial
si el volumen ya contiene una base. Para actualizar el catálogo, con el contenedor
`cinego-mysql` en ejecución, ejecutá desde la raíz del repositorio:

```bash
docker exec -i cinego-mysql sh -c 'MYSQL_PWD="$MYSQL_ROOT_PASSWORD" exec mysql --default-character-set=utf8mb4 -uroot cinego' < scripts/actualizar-peliculas.sql
```

El comando usa la contraseña configurada en el contenedor. Si la contraseña de root
se cambió directamente en MySQL, deberá utilizarse la credencial actual.

Este script es para bases de desarrollo: reemplaza los datos de las películas con
IDs 1, 2 y 3; las inserta si faltan. Conserva los IDs, sus relaciones y las demás
películas. No elimina registros de prueba como Test. Puede repetirse sin duplicar
esas películas, pero volverá a aplicar los valores definidos en el script.

Para comprobar el resultado:

```bash
docker exec cinego-mysql sh -c 'MYSQL_PWD="$MYSQL_ROOT_PASSWORD" exec mysql --default-character-set=utf8mb4 -uroot cinego -e "SELECT id, titulo, duracion, clasificacion FROM peliculas WHERE id IN (1,2,3) ORDER BY id;"'
```

Después, recargá el frontend para consultar los datos actualizados.
No es necesario borrar el volumen ni ejecutar nuevamente el script completo de
creación de tablas sobre una base existente.
