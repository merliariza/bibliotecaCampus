Listar todos los libros disponibles
```sql
SELECT titulo FROM libros WHERE cantidad > 0 ;
```
Buscar libros por género
```sql
SELECT titulo FROM libros WHERE genero = 'fantasía';
```
Obtener información de un libro por ISBN
```sql
SELECT titulo, genero, cantidad, descripcion FROM libros WHERE ISBN = '0001';
```
Contar el número de libros en la biblioteca
```sql
SELECT SUM(cantidad) FROM libros;
```
Listar todos los autores
```sql
SELECT nombre, telefono, email FROM autores;
```
Buscar autores por nombre
```sql
SELECT nombre, telefono, email FROM autores WHERE nombre = 'Camila';
```
Obtener todos los libros de un autor específico
```sql
SELECT l.isbn, l.titulo
FROM libros AS l
INNER JOIN libroAutor AS la ON l.isbn = la.isbn_libro
INNER JOIN autores AS a ON a.id = la.id_autores
WHERE a.nombre = 'Martha';
```
Listar todas las ediciones de un libro
```sql
SELECT e.isbn_libro, e.id_editorial, e.fecha, l.titulo
FROM ediciones AS e 
INNER JOIN libros AS l ON e.isbn_libro = l.isbn;
```
Obtener la última edición de un libro
```sql
SELECT e.isbn_libro, e.id_editorial, e.fecha, l.titulo
FROM ediciones AS e 
INNER JOIN libros AS l ON e.isbn_libro = l.isbn
WHERE e.fecha = (
    SELECT MAX(fecha)
    FROM ediciones 
    WHERE isbn = '0001'
)
AND l.isbn = '0001';
```
Contar cuántas ediciones hay de un libro específico
```sql
SELECT COUNT(isbn_libro) AS cantidad_ediciones
FROM ediciones
WHERE isbn_libro = '0001';
```
Listar todas las transacciones de préstamo
```sql

```
Obtener los libros prestados actualmente
```sql

```
Contar el número de transacciones de un miembro específico
```sql

```
Listar todos los miembros de la biblioteca
```sql

```
Buscar un miembro por nombre:
```sql
SELECT nombre, telefono, email FROM miembros WHERE nombre = 'Maria';
```
Obtener las transacciones de un miembro específico
```sql

```
Listar todos los libros y sus autores
```sql
SELECT l.isbn, l.titulo, a.nombre
FROM libros AS l
INNER JOIN libroAutor AS la ON l.isbn = la.isbn_libro
INNER JOIN autores AS a ON a.id = la.id_autores;
```
Obtener el historial de préstamos de un libro específico
```sql

```
Contar cuántos libros han sido prestados en total
```sql

```
Listar todos los libros junto con su última edición y estado de disponibilidad
```sql
