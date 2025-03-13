INSERT INTO biblioteca 
(nombre, telefono, email)
VALUES ('Biblioteca Campus', '607 6343252', 'bibliotecacampus@gmail.com');

INSERT INTO inventario
(id_biblioteca, descripcion)
VALUES (1, 'Inventario Biblioteca Campus');

INSERT INTO libros
(isbn, id_inventario, titulo, genero, cantidad, descripcion)
VALUES ('0001', 1, 'Cronicas de Narnia', 'Fantasía', 10, 'Jovenes y un león en Narnia'),
('0002', 1, 'Maria', 'Romance', 15, 'Una historia de romance'),
('0003', 1, 'El principito', 'Fantasía', 20, 'Principito y la rosa');

INSERT INTO editorial
(nombre, telefono, email)
VALUES ('Primera editorial', '607 6845255', 'primeraeditorial@gmail.com'),
('Segunda editorial', '607 6855255', 'segundaeditorial@gmail.com');

INSERT INTO autores
(id_editorial, nombre, telefono, email)
VALUES (1, 'Martha', '3185645233', 'marthaeditora@gmail.com'),
(2, 'Pablo', '3184245233', 'pabloeditor@gmail.com'),
(2, 'Camila', '3185644233', 'camilaeditora@gmail.com');

INSERT INTO libroAutor 
(id_autores, isbn_libro)
VALUES (1, '0001'),
(3, '0003'),
(2, '0002');

INSERT INTO ediciones
(isbn_libro, id_editorial, fecha, descripcion)
VALUES ('0001', 1, '2022-05-22', 'letra'),
('0001', 1, '2024-03-20', 'diseño'),
('0002', 2, '2020-10-12', 'portada'),
('0003', 2, '2015-04-30', 'actualización');