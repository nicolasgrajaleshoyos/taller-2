-- Computación
INSERT INTO especialidades (especialidad, totalcreditos, totalestudiantes)
VALUES ('Ciencias de la Computación', 180, 150);

-- Historia
INSERT INTO especialidades (especialidad, totalcreditos, totalestudiantes)
VALUES ('Historia', 120, 100);

-- Economía
INSERT INTO especialidades (especialidad, totalcreditos, totalestudiantes)
VALUES ('Economía', 140, 120);

-- Música
INSERT INTO especialidades (especialidad, totalcreditos, totalestudiantes)
VALUES ('Música', 100, 80);

-- Nutrición
INSERT INTO especialidades (especialidad, totalcreditos, totalestudiantes)
VALUES ('Nutrición', 160, 130);

-- Deportes
INSERT INTO especialidades (especialidad, totalcreditos, totalestudiantes)
VALUES ('Deportes', 110, 90);

-- Ciencia Política
INSERT INTO especialidades (especialidad, totalcreditos, totalestudiantes)
VALUES ('Ciencia Política', 150, 110);

select * from especialidades;

--forma en la que  se puede solucionar sin insertar los datos 
CREATE OR REPLACE PROCEDURE update_especialidades AS
BEGIN
FOR rec IN (SELECT especialidad, SUM(creditos) AS total_creditos, COUNT(*) AS total_estudiantes
              FROM estudiantes
              GROUP BY especialidad)
  LOOP
    UPDATE especialidades
    SET totalcreditos = rec.total_creditos,
        totalestudiantes = rec.total_estudiantes
    WHERE especialidad = rec.especialidad;
  END LOOP;
END update_especialidades;

execute update_especialidades;


-- forma en la que se puede hacer sin isnertar los datos 

CREATE OR REPLACE PROCEDURE update_especialidades AS
BEGIN
  FOR rec IN (SELECT especialidad, SUM(creditos) AS total_creditos, COUNT(*) AS total_estudiantes
              FROM estudiantes
              GROUP BY especialidad)
  LOOP
    DECLARE
      v_exists NUMBER;
    BEGIN
      SELECT COUNT(*) INTO v_exists FROM especialidades WHERE especialidad = rec.especialidad;
      
      IF v_exists > 0 THEN
        UPDATE especialidades
        SET totalcreditos = rec.total_creditos,
            totalestudiantes = rec.total_estudiantes
        WHERE especialidad = rec.especialidad;
      ELSE
        INSERT INTO especialidades (especialidad, totalcreditos, totalestudiantes)
        VALUES (rec.especialidad, rec.total_creditos, rec.total_estudiantes);
      END IF;
    END;
  END LOOP;
END update_especialidades;