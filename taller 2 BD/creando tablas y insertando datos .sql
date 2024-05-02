--ZONA DE Eliminacion de Objetos


drop table matriculas;
drop table cursos;
drop table estudiantes;
drop table aulas;
drop table especialidades;
drop table cambios;
drop table errores;
drop table temporal;





--ZONA DE Creacion de Objetos

CREATE TABLE estudiantes (
id        	 	NUMBER(5),
nombre           	CHAR(20),
apellido         	CHAR(20),
especialidad     	CHAR(30),
creditos         	NUMBER(2),
constraint esidpk PRIMARY KEY(id)
);

CREATE TABLE aulas (
idaula       	 	NUMBER(5), 
edificio    		CHAR(15),
numeroaula    	NUMBER,
numeroasientos  	NUMBER,
descripcionaula 	CHAR(50),
constraint auidpk 	PRIMARY KEY(idaula)
);

CREATE  TABLE especialidades (
especialidad     	CHAR(30),
totalcreditos    	NUMBER,
totalestudiantes 	NUMBER
);

CREATE TABLE cursos (
departamento     	CHAR(3),
ncurso        	NUMBER,
descripcioncurso 	CHAR(200),
cupoestudiantes  	NUMBER,
nestudiantes     	NUMBER,
ncreditos        	NUMBER,
idaula         	NUMBER,
CONSTRAINT cudecupk
    PRIMARY KEY (departamento,ncurso),
CONSTRAINT cuidfk
    FOREIGN KEY(idaula) REFERENCES aulas(idaula) 
);

CREATE TABLE matriculas (
idestudiante    	NUMBER  NOT NULL,
departamento    	CHAR(3) NOT NULL,
ncurso      		NUMBER  NOT NULL,
grado        		CHAR(1),
CONSTRAINT magrch CHECK (UPPER(grado) IN ('A', 'B', 'C', 'D', 'E')),
CONSTRAINT maidfk FOREIGN KEY(idestudiante) REFERENCES estudiantes(id), 
CONSTRAINT madecufk FOREIGN KEY(departamento, ncurso) REFERENCES cursos(departamento, ncurso)
);

CREATE TABLE cambios (
tipo        			CHAR(1) NOT NULL,
razon        			CHAR(8) NOT NULL,
fecha        			DATE NOT NULL,
antiguoidestudiante  		NUMBER(5),
antiguodepartamento     	CHAR(3),
antiguocurso        		NUMBER(3),
antiguogrado        		CHAR(1),
nuevoidestudiante    		NUMBER(5),
nuevodepartamento    	CHAR(3),
nuevoncurso        		NUMBER(3),
nuevogrado       		CHAR(1)
);

CREATE TABLE errores (
codigo    		NUMBER,
mensaje    	VARCHAR2(200),
informacion	VARCHAR2(100)
);

CREATE TABLE temporal (
columnanumerica    	NUMBER,
columnacaracter 	VARCHAR2(60)
);




--------------------------------------
--------------------------------------
--zona de insercion de registros


--INSERTAR REGISTROS
INSERT INTO ESTUDIANTES VALUES (1, 'Silvio', 'Suarez', 'Computacion', 12);
INSERT INTO ESTUDIANTES VALUES (2, 'Maragarita', 'Mason', 'Historia', 5);
INSERT INTO ESTUDIANTES VALUES (3, 'Joana', 'Junin', 'Computacion', 8);
INSERT INTO ESTUDIANTES VALUES (4, 'Mauricio', 'Murcia', 'Economia', 9);
INSERT INTO ESTUDIANTES VALUES (5, 'Patricio', 'Poll', 'Historia', 11);
INSERT INTO ESTUDIANTES VALUES (6, 'Tiberio', 'Tulande', 'Historia', 12);
INSERT INTO ESTUDIANTES VALUES (7, 'Barbara', 'Buitrago', 'Economia', 5);
INSERT INTO ESTUDIANTES VALUES (8, 'David', 'Diaz', 'Musica', 3);
INSERT INTO ESTUDIANTES VALUES (9, 'Ester', 'Bueno', 'Nutricion', 2);
INSERT INTO ESTUDIANTES VALUES (10, 'Rosa', 'Rueda', 'Musica', 1);
INSERT INTO ESTUDIANTES VALUES (11, 'Fernando', 'Ramirez', 'Nutricion', 6);
INSERT INTO ESTUDIANTES VALUES (12, 'Jose', 'Salas', 'Nutricion', 2);
INSERT INTO ESTUDIANTES VALUES (13, 'Gonzalo', 'Pajoi', 'Computacion', 2);
INSERT INTO ESTUDIANTES VALUES (14, 'Silvia', 'Morales', 'Computacion', 11);
INSERT INTO ESTUDIANTES VALUES (15, 'Natalia', 'Maral', 'Computacion', 5);
INSERT INTO ESTUDIANTES VALUES (16, 'Rafael', 'Morales', 'Computacion', 5);
INSERT INTO ESTUDIANTES VALUES (17, 'Mauricio', 'Puerta', 'Economia', 4);
INSERT INTO ESTUDIANTES VALUES (18, 'Esperanza', 'Gomez', 'Economia', 31);
INSERT INTO ESTUDIANTES VALUES (19, 'Tarsicio', 'Piraquive', 'Historia', 11);
INSERT INTO ESTUDIANTES VALUES (20, 'Vanessa', 'Medina', 'Economia', 5);
INSERT INTO ESTUDIANTES VALUES (21, 'Ruperto', 'Diaz', 'Musica', 3);
INSERT INTO ESTUDIANTES VALUES (22, 'Eutimio', 'Pastrana', 'Nutricion', 12);
INSERT INTO ESTUDIANTES VALUES (23, 'Roserito', 'Rosendo', 'Musica', 7);
INSERT INTO ESTUDIANTES VALUES (24, 'Paulo', 'Rodriguez', 'Nutricion', 6);
INSERT INTO ESTUDIANTES VALUES (25, 'Jose', 'Arango', 'Nutricion', 5);
INSERT INTO ESTUDIANTES VALUES (26, 'Gina', 'Benedetti', 'Computacion', 2);
INSERT INTO ESTUDIANTES VALUES (27, 'Osman', 'Kiarnas', 'Computacion', 12);
INSERT INTO ESTUDIANTES VALUES (28, 'Maria', 'Cheka', 'Musica', 11);
INSERT INTO ESTUDIANTES VALUES (29, 'Johanita', 'Uribe', 'Nutricion', 6);
INSERT INTO ESTUDIANTES VALUES (30, 'Mariana', 'Montes', 'Nutricion', 3);
INSERT INTO ESTUDIANTES VALUES (31, 'Pablo', 'Orteman', 'Computacion', 2);
INSERT INTO ESTUDIANTES VALUES (32, 'Sonia', 'Suarez', 'Computacion', 12);
INSERT INTO ESTUDIANTES VALUES (33, 'Maragarita', 'Del Rio', 'Historia', 15);
INSERT INTO ESTUDIANTES VALUES (34, 'Joana', 'Junin', 'Computacion', 8);
INSERT INTO ESTUDIANTES VALUES (35, 'Dolph', 'Lundgreen', 'Economia', 19);
INSERT INTO ESTUDIANTES VALUES (36, 'Silvester', 'Stallone', 'Historia', 11);
INSERT INTO ESTUDIANTES VALUES (37, 'Tony', 'Stark', 'Historia', 12);
INSERT INTO ESTUDIANTES VALUES (38, 'Julio', 'Iglesias', 'Economia', 15);
INSERT INTO ESTUDIANTES VALUES (39, 'David', 'Diaz', 'Musica', 2);
INSERT INTO ESTUDIANTES VALUES (40, 'Kathia', 'Rebuena', 'Nutricion', 2);
INSERT INTO ESTUDIANTES VALUES (41, 'Mauricio', 'Rueda', 'Musica', 11);
INSERT INTO ESTUDIANTES VALUES (42, 'Fernanda', 'Ramirez', 'Nutricion', 16);
INSERT INTO ESTUDIANTES VALUES (43, 'Joselito', 'Salas', 'Nutricion', 2);
INSERT INTO ESTUDIANTES VALUES (44, 'Sofia', 'Vergara', 'Computacion', 12);
INSERT INTO ESTUDIANTES VALUES (45, 'Silvia', 'Sason', 'Computacion', 11);
INSERT INTO ESTUDIANTES VALUES (46, 'Natalia', 'Vega', 'Computacion', 5);
INSERT INTO ESTUDIANTES VALUES (47, 'Rafael', 'Vargas', 'Computacion', 5);
INSERT INTO ESTUDIANTES VALUES (48, 'Bruno', 'Diaz', 'Economia', 4);
INSERT INTO ESTUDIANTES VALUES (49, 'Clark', 'Kent', 'Economia', 11);
INSERT INTO ESTUDIANTES VALUES (50, 'Iyiko', 'Maton', 'Historia', 11);
INSERT INTO ESTUDIANTES VALUES (51, 'Vanessa', 'Medina', 'Economia', 4);
INSERT INTO ESTUDIANTES VALUES (52, 'Ruperto', 'Diaz', 'Musica', 13);
INSERT INTO ESTUDIANTES VALUES (53, 'Marina', 'Pastrana', 'Nutricion', 10);
INSERT INTO ESTUDIANTES VALUES (54, 'Roserito', 'Rosendo', 'Musica', 1);
INSERT INTO ESTUDIANTES VALUES (55, 'Paulo', 'Rodriguez', 'Nutricion', 6);
INSERT INTO ESTUDIANTES VALUES (56, 'Jose', 'Arango', 'Nutricion', 5);
INSERT INTO ESTUDIANTES VALUES (57, 'Gina', 'Benedetti', 'Computacion', 6);
INSERT INTO ESTUDIANTES VALUES (58, 'Mario', 'Aguirre', 'Musica', 11);
INSERT INTO ESTUDIANTES VALUES (59, 'Alvaro', 'Uribe', 'Ciencias Politicas', 6);
INSERT INTO ESTUDIANTES VALUES (60, 'Mariana', 'Pajoi', 'Deportes', 3);
INSERT INTO ESTUDIANTES VALUES (61, 'Pablito', 'Armero', 'Deportes', 19);
INSERT INTO ESTUDIANTES VALUES (62, 'Mariana', 'Jailama', 'Computacion', 4);
INSERT INTO ESTUDIANTES VALUES (63, 'Juliana', 'Simens', 'Computacion', 14);
INSERT INTO ESTUDIANTES VALUES (64, 'Carolina', 'Vesga', 'Computacion', 3);
INSERT INTO ESTUDIANTES VALUES (65, 'Karla', 'Rodriguez', 'Nutricion', 2);
INSERT INTO ESTUDIANTES VALUES (66, 'Mario', 'Arango', 'Nutricion', 4);
INSERT INTO ESTUDIANTES VALUES (67, 'Hernan', 'Penagos', 'Computacion', 4);
INSERT INTO ESTUDIANTES VALUES (68, 'Hernando', 'Merchan', 'Musica', 10);
INSERT INTO ESTUDIANTES VALUES (69, 'Kurt', 'Russel', 'Ciencias Politicas', 4);
INSERT INTO ESTUDIANTES VALUES (70, 'Diego', 'Pai', 'Deportes', 13);
INSERT INTO ESTUDIANTES VALUES (71, 'Prudencio', 'Arciniegas', 'Deportes', 19);
INSERT INTO ESTUDIANTES VALUES (72, 'Gildardo', 'Vega', 'Computacion', 12);
INSERT INTO ESTUDIANTES VALUES (73, 'Guevardo', 'Simpues', 'Computacion', 11);
INSERT INTO ESTUDIANTES VALUES (74, 'Norida', 'Vega', 'Ciencias Politicas', 5);
INSERT INTO ESTUDIANTES VALUES (75, 'Gil', 'Rodas', 'Nutricion', 6);
INSERT INTO ESTUDIANTES VALUES (76, 'Josue', 'Arango', 'Nutricion', 5);
INSERT INTO ESTUDIANTES VALUES (77, 'Juan', 'Benedetti', 'Computacion', 6);
INSERT INTO ESTUDIANTES VALUES (78, 'Carlos', 'Puyol', 'Musica', 11);
INSERT INTO ESTUDIANTES VALUES (79, 'Marina', 'Arteaga', 'Ciencias Politicas', 6);
INSERT INTO ESTUDIANTES VALUES (80, 'Mario', 'Puerta', 'Deportes', 3);
INSERT INTO ESTUDIANTES VALUES (81, 'Juan', 'Cabrera', 'Deportes', 9);
INSERT INTO ESTUDIANTES VALUES (82, 'Luis', 'Gamero', 'Deportes', 3);
INSERT INTO ESTUDIANTES VALUES (83, 'Saira', 'Diaz', 'Ciencias Politicas', 4);
INSERT INTO ESTUDIANTES VALUES (84, 'Carolina', 'Vargar', 'Computacion', 3);
INSERT INTO ESTUDIANTES VALUES (85, 'Mercede', 'Galarza', 'Ciencias Politicas', 2);
INSERT INTO ESTUDIANTES VALUES (86, 'Gloria', 'Ospina', 'Nutricion', 4);
INSERT INTO ESTUDIANTES VALUES (87, 'Angela', 'Tabares', 'Computacion', 4);
INSERT INTO ESTUDIANTES VALUES (88, 'Irene', 'Piedrahita', 'Musica', 10);
INSERT INTO ESTUDIANTES VALUES (89, 'Kurt', 'Kart', 'Ciencias Politicas', 14);
INSERT INTO ESTUDIANTES VALUES (90, 'Lina', 'Hincapie', 'Deportes', 13);
INSERT INTO ESTUDIANTES VALUES (91, 'Silvana', 'Sibundoy', 'Deportes', 11);
INSERT INTO ESTUDIANTES VALUES (92, 'Karla', 'Bruni', 'Nutricion', 12);
INSERT INTO ESTUDIANTES VALUES (93, 'Mia', 'Kalifa', 'Computacion', 10);
INSERT INTO ESTUDIANTES VALUES (94, 'Norida', 'Rodriguez', 'Ciencias Politicas', 5);
INSERT INTO ESTUDIANTES VALUES (95, 'Sandra', 'Naranjo', 'Nutricion', 3);
INSERT INTO ESTUDIANTES VALUES (96, 'Paula', 'Bedoya', 'Nutricion', 9);
INSERT INTO ESTUDIANTES VALUES (97, 'Juan', 'Charrasquiado', 'Nutricion', 6);
INSERT INTO ESTUDIANTES VALUES (98, 'Clark', 'Kent', 'Musica', 11);
INSERT INTO ESTUDIANTES VALUES (99, 'Artur', 'Curry', 'Ciencias Politicas', 6);
INSERT INTO ESTUDIANTES VALUES (100, 'Barry', 'Allen', 'Nutricion', 3);
INSERT INTO ESTUDIANTES VALUES (101, 'Diana', 'Prince', 'Musica', 9);
INSERT INTO ESTUDIANTES VALUES (102, 'Luisa', 'Dasilva', 'Musica', 3);
INSERT INTO ESTUDIANTES VALUES (103, 'Nina', 'Diaz', 'Ciencias Politicas', 4);
INSERT INTO ESTUDIANTES VALUES (104, 'Carolina', 'Vergara', 'Computacion', 3);
INSERT INTO ESTUDIANTES VALUES (105, 'Mercede', 'Galarza', 'Ciencias Politicas', 2);
INSERT INTO ESTUDIANTES VALUES (106, 'Georgina', 'Ospina', 'Nutricion', 14);
INSERT INTO ESTUDIANTES VALUES (107, 'Angela', 'Vergara', 'Computacion', 4);
INSERT INTO ESTUDIANTES VALUES (108, 'Irene', 'Pedreros', 'Musica', 10);
INSERT INTO ESTUDIANTES VALUES (109, 'Kurt', 'Goegel', 'Ciencias Politicas', 14);
INSERT INTO ESTUDIANTES VALUES (110, 'Luis', 'Hincapie', 'Deportes', 13);
INSERT INTO ESTUDIANTES VALUES (111, 'Carlos', 'Duterte', 'Musica', 11);
INSERT INTO ESTUDIANTES VALUES (112, 'Mario', 'Marin', 'Nutricion', 12);
INSERT INTO ESTUDIANTES VALUES (113, 'Mia', 'Torres', 'Computacion', 10);
INSERT INTO ESTUDIANTES VALUES (114, 'Norida', 'Gonzales', 'Ciencias Politicas', 5);
INSERT INTO ESTUDIANTES VALUES (115, 'Luis', 'Naranjo', 'Musica', 3);
INSERT INTO ESTUDIANTES VALUES (116, 'Paulo', 'Dunlor', 'Nutricion', 9);
INSERT INTO ESTUDIANTES VALUES (117, 'Pedro', 'Infante', 'Nutricion', 6);
INSERT INTO ESTUDIANTES VALUES (118, 'Clark', 'Hors', 'Musica', 11);
INSERT INTO ESTUDIANTES VALUES (119, 'Ricardo', 'Tapias', 'Ciencias Politicas', 6);
INSERT INTO ESTUDIANTES VALUES (120, 'Nairo', 'Quintana', 'Nutricion', 3);
INSERT INTO ESTUDIANTES VALUES (121, 'George', 'De Oliveria', 'Musica', 9);
INSERT INTO ESTUDIANTES VALUES (122, 'Mario', 'Puerta', 'Deportes', 3);
INSERT INTO ESTUDIANTES VALUES (123, 'Juana', 'Tenjo', 'Deportes', 9);
INSERT INTO ESTUDIANTES VALUES (124, 'Luisa', 'Gamero', 'Deportes', 3);
INSERT INTO ESTUDIANTES VALUES (125, 'Daniela', 'Diaz', 'Ciencias Politicas', 4);
INSERT INTO ESTUDIANTES VALUES (126, 'Carolina', 'Vargar', 'Computacion', 3);
INSERT INTO ESTUDIANTES VALUES (127, 'Mariana', 'Escopio', 'Economia', 2);
INSERT INTO ESTUDIANTES VALUES (128, 'Luna', 'Ospina', 'Nutricion', 4);
INSERT INTO ESTUDIANTES VALUES (129, 'Angel', 'Merchan', 'Computacion', 4);
INSERT INTO ESTUDIANTES VALUES (130, 'Angelina', 'Jolie', 'Musica', 10);
INSERT INTO ESTUDIANTES VALUES (131, 'Kurt', 'Kart', 'Economia', 14);
INSERT INTO ESTUDIANTES VALUES (132, 'Esvetlana', 'Hackers', 'Deportes', 13);
INSERT INTO ESTUDIANTES VALUES (133, 'Silvana', 'Sibundoy', 'Deportes', 11);
INSERT INTO ESTUDIANTES VALUES (134, 'Fedra', 'Fiajok', 'Nutricion', 12);
INSERT INTO ESTUDIANTES VALUES (135, 'Paola', 'Juarez', 'Economia', 10);
INSERT INTO ESTUDIANTES VALUES (136, 'Jordi', 'Rodriguez', 'Ciencias Politicas', 5);
INSERT INTO ESTUDIANTES VALUES (137, 'Lucero', 'Naranjo', 'Nutricion', 13);
INSERT INTO ESTUDIANTES VALUES (138, 'Paula', 'Bedoya', 'Nutricion', 9);
INSERT INTO ESTUDIANTES VALUES (139, 'Juana', 'Charrasquiado', 'Economia', 16);
INSERT INTO ESTUDIANTES VALUES (140, 'Carlos', 'Manotas', 'Musica', 11);
INSERT INTO ESTUDIANTES VALUES (141, 'Arturo', 'Herrero', 'Musica', 6);
INSERT INTO ESTUDIANTES VALUES (142, 'Hugo', 'Allen', 'Musica', 3);
INSERT INTO ESTUDIANTES VALUES (143, 'Diana', 'Frias', 'Musica', 9);
INSERT INTO ESTUDIANTES VALUES (144, 'Marino', 'Del Potro', 'Computacion', 3);
INSERT INTO ESTUDIANTES VALUES (145, 'Juancho', 'Rois', 'Economia', 9);
INSERT INTO ESTUDIANTES VALUES (146, 'Oliver', 'Atom', 'Deportes', 3);
INSERT INTO ESTUDIANTES VALUES (147, 'Julieta', 'Brochs', 'Ciencias Politicas', 4);
INSERT INTO ESTUDIANTES VALUES (148, 'Carolina', 'Lopez', 'Economia', 3);
INSERT INTO ESTUDIANTES VALUES (149, 'Mercedes', 'Karson', 'Economia', 2);
INSERT INTO ESTUDIANTES VALUES (150, 'Gloria', 'Trevi', 'Nutricion', 4);
INSERT INTO ESTUDIANTES VALUES (151, 'Angela', 'Tabares', 'Computacion', 4);
INSERT INTO ESTUDIANTES VALUES (152, 'Irene', 'Piedrahita', 'Musica', 10);
INSERT INTO ESTUDIANTES VALUES (153, 'Federico', 'Kart', 'Ciencias Politicas', 14);
INSERT INTO ESTUDIANTES VALUES (154, 'Maria', 'Hincapie', 'Economia', 13);
INSERT INTO ESTUDIANTES VALUES (155, 'Hans', 'Solo', 'Deportes', 11);
INSERT INTO ESTUDIANTES VALUES (156, 'Lee', 'Mejors', 'Nutricion', 12);
INSERT INTO ESTUDIANTES VALUES (157, 'Oscar', 'Golman', 'Computacion', 10);
INSERT INTO ESTUDIANTES VALUES (158, 'Fernando', 'Carrillo', 'Ciencias Politicas', 5);
INSERT INTO ESTUDIANTES VALUES (159, 'Sonia', 'Naranjo', 'Nutricion', 3);
INSERT INTO ESTUDIANTES VALUES (160, 'Diego', 'Maradona', 'Nutricion', 9);
INSERT INTO ESTUDIANTES VALUES (161, 'Juan', 'Charrasquiado', 'Computacion', 6);
INSERT INTO ESTUDIANTES VALUES (162, 'Ricardo', 'Gareca', 'Musica', 11);
INSERT INTO ESTUDIANTES VALUES (163, 'Sergio', 'Santin', 'Ciencias Politicas', 6);
INSERT INTO ESTUDIANTES VALUES (164, 'Arturo', 'Jaramillo', 'Economia', 3);
INSERT INTO ESTUDIANTES VALUES (165, 'Diana', 'Prince', 'Economia', 9);
INSERT INTO ESTUDIANTES VALUES (166, 'Vaneza', 'Puerta', 'Deportes', 3);
INSERT INTO ESTUDIANTES VALUES (167, 'Juana', 'Pedrero', 'Deportes', 9);
INSERT INTO ESTUDIANTES VALUES (168, 'Ignacio', 'Vidal', 'Deportes',13);
INSERT INTO ESTUDIANTES VALUES (169, 'Reina', 'Monteto', 'Ciencias Politicas', 14);
INSERT INTO ESTUDIANTES VALUES (170, 'Kendra', 'Lust', 'Computacion', 3);
INSERT INTO ESTUDIANTES VALUES (171, 'Monica', 'Galindo', 'Ciencias Politicas', 12);
INSERT INTO ESTUDIANTES VALUES (172, 'Humberto', 'Ospina', 'Nutricion', 4);
INSERT INTO ESTUDIANTES VALUES (173, 'Antonia', 'Tabares', 'Computacion', 4);
INSERT INTO ESTUDIANTES VALUES (174, 'Irina', 'Piedrahita', 'Musica', 10);
INSERT INTO ESTUDIANTES VALUES (175, 'Karl', 'Kartor', 'Ciencias Politicas', 14);
INSERT INTO ESTUDIANTES VALUES (176, 'Lorenzo', 'Hincapie', 'Deportes', 13);
INSERT INTO ESTUDIANTES VALUES (177, 'Marcelo', 'Sibundoy', 'Deportes', 11);
INSERT INTO ESTUDIANTES VALUES (178, 'Fabricio', 'Bruni', 'Nutricion', 12);
INSERT INTO ESTUDIANTES VALUES (179, 'Linda', 'Kalifa', 'Computacion', 10);
INSERT INTO ESTUDIANTES VALUES (180, 'Norbertó', 'Rodriguez', 'Ciencias Politicas', 5);
INSERT INTO ESTUDIANTES VALUES (181, 'Zania', 'Naranjo', 'Nutricion', 3);
INSERT INTO ESTUDIANTES VALUES (182, 'Paola', 'Bedoya', 'Nutricion', 9);
INSERT INTO ESTUDIANTES VALUES (183, 'Juan', 'Charrasquiado', 'Nutricion', 6);
INSERT INTO ESTUDIANTES VALUES (184, 'Leonardo', 'Kent', 'Musica', 11);
INSERT INTO ESTUDIANTES VALUES (185, 'Camilo', 'Curry', 'Ciencias Politicas', 6);
INSERT INTO ESTUDIANTES VALUES (186, 'Jose', 'Allen', 'Nutricion', 3);



--INSERTAR AULAS
INSERT INTO AULAS VALUES (99999, 'Torre 7', 310, 1000, 'Lectura Hall Largo');
INSERT INTO AULAS VALUES (99998, 'Torre 6', 101, 500, 'Lectura Hall Pequeño');
INSERT INTO AULAS VALUES (99997, 'Torre 6', 150, 50, 'Discucion cuarto A');
INSERT INTO AULAS VALUES (99996, 'Torre 6', 160, 50, 'Discucion cuarto B');
INSERT INTO AULAS VALUES (99995, 'Torre 6', 170, 50, 'Discucion cuarto C');
INSERT INTO AULAS VALUES (99994, 'Musica Torre', 100, 10, 'Practica de Musica');
INSERT INTO AULAS VALUES (99993, 'Musica Torre', 200, 1000, 'Cuarto de Concierto');
INSERT INTO AULAS VALUES (99992, 'Torre 7', 300, 75, 'Laboratorio de Datos');
INSERT INTO AULAS VALUES (99991, 'Torre 7', 310, 50, 'Laboratorio Moviles');
INSERT INTO AULAS VALUES (99990, 'Cancha', 310, 50, 'Sintetica Deportiva');
INSERT INTO AULAS VALUES (89999, 'Anfiteatro', 310, 80, 'Practica Medica');
INSERT INTO AULAS VALUES (89998, 'Auditorio', 310, 300, 'Expositores');
INSERT INTO AULAS VALUES (89991, 'Torre 7', 310, 1000, 'Lectura Hall Largo');
INSERT INTO AULAS VALUES (89992, 'Torre 6', 101, 500, 'Lectura Hall Pequeño');
INSERT INTO AULAS VALUES (89993, 'Torre 6', 150, 50, 'Discucion cuarto A');
INSERT INTO AULAS VALUES (89994, 'Torre 6', 160, 50, 'Discucion cuarto B');
INSERT INTO AULAS VALUES (89995, 'Torre 6', 170, 50, 'Discucion cuarto C');
INSERT INTO AULAS VALUES (89996, 'Musica Torre', 100, 10, 'Practica de Musica');
INSERT INTO AULAS VALUES (89997, 'Musica Torre', 200, 1000, 'Cuarto de Concierto');
INSERT INTO AULAS VALUES (89989, 'Torre 7', 300, 75, 'Laboratorio de Datos');
INSERT INTO AULAS VALUES (89988, 'Torre 7', 310, 50, 'Laboratorio Moviles');
INSERT INTO AULAS VALUES (89987, 'Cancha de Tenis', 310, 50, 'Sintetica Deportiva');
INSERT INTO AULAS VALUES (89986, 'Resital', 310, 80, 'Practica Medica');
INSERT INTO AULAS VALUES (89985, 'Au Rectoria', 310, 300, 'Expositores');
INSERT INTO AULAS VALUES (79999, 'Sala Prensa', 310, 1000, 'Lectura Hall Largo');
INSERT INTO AULAS VALUES (79998, 'Salon eventos', 101, 500, 'Lectura Hall Pequeño');
INSERT INTO AULAS VALUES (79997, 'Com Principal', 150, 50, 'Discucion cuarto A');
INSERT INTO AULAS VALUES (79996, 'Torre 16', 160, 50, 'Discucion cuarto B');
INSERT INTO AULAS VALUES (79995, 'Torre 16', 170, 50, 'Discucion cuarto C');
INSERT INTO AULAS VALUES (79994, 'Ciencias T1', 100, 10, 'Practica de Musica');
INSERT INTO AULAS VALUES (79993, 'Ciencias T2', 200, 1000, 'Cuarto de Concierto');
INSERT INTO AULAS VALUES (79992, 'Torre 17', 300, 75, 'Laboratorio de Datos');
INSERT INTO AULAS VALUES (79991, 'Torre 27', 310, 50, 'Laboratorio Moviles');
INSERT INTO AULAS VALUES (79990, 'Can Beisbol', 310, 50, 'Sintetica Deportiva');
INSERT INTO AULAS VALUES (79989, 'Medico', 310, 80, 'Practica Medica');
INSERT INTO AULAS VALUES (79988, 'Aud Alt', 310, 300, 'Expositores');


--INSERTAR CURSOS
INSERT INTO CURSOS VALUES ('HIS', 101, 'Historia 101', 30, 0, 4, 99999);
INSERT INTO CURSOS VALUES ('HIS', 301, 'Historia 301', 30, 0, 4, 99995);
INSERT INTO CURSOS VALUES ('CTS', 101, 'Computacion 101', 50, 0, 4, 99998);
INSERT INTO CURSOS VALUES ('ECN', 203, 'Economia 203', 15, 0, 3, 99997);
INSERT INTO CURSOS VALUES ('CTS', 102, 'Computacion 102', 35, 0, 4, 99996);
INSERT INTO CURSOS VALUES ('MUS', 410, 'Musica 410', 5, 0, 3, 99994);
INSERT INTO CURSOS VALUES ('ECN', 101, 'Economia 101', 50, 0, 4, 99992);
INSERT INTO CURSOS VALUES ('NUT', 307, 'Nutricion 307', 20, 0, 4, 99991);
INSERT INTO CURSOS VALUES ('DEP', 100, 'Deportes', 90, 0, 4, 99990);
INSERT INTO CURSOS VALUES ('PRO', 122, 'Programacion 1', 20, 0, 4, 99991);
INSERT INTO CURSOS VALUES ('BD2', 122, 'Bases de Datos 2', 20, 0, 4, 99992);
INSERT INTO CURSOS VALUES ('CIV', 129, 'Derecho Civil', 2, 40, 4, 99997);

INSERT INTO CURSOS VALUES ('BIO', 555, 'Historia 101', 30, 0, 4, 79999);
INSERT INTO CURSOS VALUES ('INT', 301, 'Historia 301', 30, 0, 4, 79998);
INSERT INTO CURSOS VALUES ('SOF', 101, 'Software 101', 50, 0, 4, 79991);
INSERT INTO CURSOS VALUES ('PR2', 102, 'Economia 203', 15, 0, 3, 99997);
INSERT INTO CURSOS VALUES ('PR1', 102, 'Computacion 102', 35, 0, 4, 79991);
INSERT INTO CURSOS VALUES ('INT', 410, 'Musica 410', 5, 0, 3, 89996);
INSERT INTO CURSOS VALUES ('ECN', 201, 'Economia 101', 50, 0, 4, 99992);
INSERT INTO CURSOS VALUES ('DIS', 307, 'Nutricion 307', 20, 0, 4, 99991);
INSERT INTO CURSOS VALUES ('BD1', 100, 'Bases de datos I', 20, 0, 4, 99990);
INSERT INTO CURSOS VALUES ('PRO', 123, 'Programacion 1', 20, 0, 4, 79996);
INSERT INTO CURSOS VALUES ('BD2', 124, 'Bases de Datos 2', 20, 0, 4, 99992);
INSERT INTO CURSOS VALUES ('CVI', 130, 'Derecho Civil', 2, 40, 4, 99997);

INSERT INTO CURSOS VALUES ('HIS', 106, 'Historia 101', 30, 0, 4, 99999);
INSERT INTO CURSOS VALUES ('HIS', 311, 'Historia 301', 30, 0, 4, 79991);
INSERT INTO CURSOS VALUES ('CTS', 111, 'Computacion 101', 50, 0, 4, 99998);
INSERT INTO CURSOS VALUES ('ECN', 303, 'Economia 203', 15, 0, 3, 99997);
INSERT INTO CURSOS VALUES ('CTN', 102, 'Computacion 102', 35, 0, 4, 99996);
INSERT INTO CURSOS VALUES ('MUS', 510, 'Musica 410', 5, 0, 3, 99994);
INSERT INTO CURSOS VALUES ('ECN', 901, 'Economia 101', 50, 0, 4, 99992);
INSERT INTO CURSOS VALUES ('NUT', 407, 'Nutricion 307', 20, 0, 4, 99991);
INSERT INTO CURSOS VALUES ('DEP', 200, 'Deportes', 90, 0, 4, 99990);
INSERT INTO CURSOS VALUES ('PRO', 102, 'Programacion 2', 20, 0, 4, 89992);
INSERT INTO CURSOS VALUES ('BD3', 122, 'Bases de Datos 3', 20, 0, 4, 99992);
INSERT INTO CURSOS VALUES ('CIV', 109, 'Derecho Civil 3', 2, 40, 4,89992);

/*
--INSERTAR ESTUDIOS
INSERT INTO MATRICULAS VALUES (1, 'CTS', 102, 'A');
INSERT INTO MATRICULAS VALUES (3, 'CTS', 102, 'B');
INSERT INTO MATRICULAS VALUES (4, 'BD2', 122, 'C');
INSERT INTO MATRICULAS VALUES (81, 'BD2', 122, 'C');
INSERT INTO MATRICULAS VALUES (1, 'HIS', 101, 'A');
INSERT INTO MATRICULAS VALUES (2, 'HIS', 101, 'B');
INSERT INTO MATRICULAS VALUES (3, 'HIS', 101, 'B');
INSERT INTO MATRICULAS VALUES (4, 'HIS', 101, 'A');
INSERT INTO MATRICULAS VALUES (5, 'HIS', 101, 'C');
INSERT INTO MATRICULAS VALUES (6, 'HIS', 101, 'C');
INSERT INTO MATRICULAS VALUES (7, 'HIS', 101, 'E');
INSERT INTO MATRICULAS VALUES (8, 'HIS', 101, 'B');
INSERT INTO MATRICULAS VALUES (9, 'HIS', 101, 'A');
INSERT INTO MATRICULAS VALUES (10, 'HIS', 101, 'D');
INSERT INTO MATRICULAS VALUES (11, 'HIS', 101, 'A');
INSERT INTO MATRICULAS VALUES (9, 'NUT', 307, 'A');
INSERT INTO MATRICULAS VALUES (11, 'NUT', 307, 'A');
INSERT INTO MATRICULAS VALUES (10, 'MUS', 410, 'B');
INSERT INTO MATRICULAS VALUES (7, 'MUS', 410, 'E');
INSERT INTO MATRICULAS VALUES (1, 'DEP', 100, 'E');
INSERT INTO MATRICULAS VALUES (13, 'CTS', 102, 'B');
INSERT INTO MATRICULAS VALUES (24, 'CTS', 102, 'C');
INSERT INTO MATRICULAS VALUES (61, 'HIS', 101, 'A');
INSERT INTO MATRICULAS VALUES (22, 'HIS', 101, 'B');
INSERT INTO MATRICULAS VALUES (13, 'HIS', 101, 'B');
INSERT INTO MATRICULAS VALUES (14, 'HIS', 101, 'A');
INSERT INTO MATRICULAS VALUES (5, 'HIS', 301, 'C');
INSERT INTO MATRICULAS VALUES (7, 'PRO', 122, 'C');
INSERT INTO MATRICULAS VALUES (7, 'DEP', 100, 'E');
INSERT INTO MATRICULAS VALUES (8, 'HIS', 101, 'B');
INSERT INTO MATRICULAS VALUES (19, 'HIS', 101, 'A');
INSERT INTO MATRICULAS VALUES (10, 'HIS', 101, 'D');
INSERT INTO MATRICULAS VALUES (11, 'HIS', 101, 'A');
INSERT INTO MATRICULAS VALUES (9, 'PRO', 122, 'A');
INSERT INTO MATRICULAS VALUES (21, 'NUT', 307, 'A');
INSERT INTO MATRICULAS VALUES (1, 'MUS', 410, 'B');
INSERT INTO MATRICULAS VALUES (7, 'MUS', 410, 'E');
INSERT INTO MATRICULAS VALUES (7, 'MUS', 410, 'E');
INSERT INTO MATRICULAS VALUES (23, 'CIV', 129, 'A');
INSERT INTO MATRICULAS VALUES (23, 'CIV', 129, 'A');
INSERT INTO MATRICULAS VALUES (23, 'CIV', 129, 'A');
INSERT INTO MATRICULAS VALUES (23, 'CIV', 129, 'A');
-- Confirmacion de la operacion
*/
  
COMMIT;

