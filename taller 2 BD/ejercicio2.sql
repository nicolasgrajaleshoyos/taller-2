-- Computaci�n
INSERT INTO especialidades (especialidad, totalcreditos, totalestudiantes)
VALUES ('Ciencias de la Computaci�n', 180, 150);

-- Historia
INSERT INTO especialidades (especialidad, totalcreditos, totalestudiantes)
VALUES ('Historia', 120, 100);

-- Econom�a
INSERT INTO especialidades (especialidad, totalcreditos, totalestudiantes)
VALUES ('Econom�a', 140, 120);

-- M�sica
INSERT INTO especialidades (especialidad, totalcreditos, totalestudiantes)
VALUES ('M�sica', 100, 80);

-- Nutrici�n
INSERT INTO especialidades (especialidad, totalcreditos, totalestudiantes)
VALUES ('Nutrici�n', 160, 130);

-- Deportes
INSERT INTO especialidades (especialidad, totalcreditos, totalestudiantes)
VALUES ('Deportes', 110, 90);

-- Ciencia Pol�tica
INSERT INTO especialidades (especialidad, totalcreditos, totalestudiantes)
VALUES ('Ciencia Pol�tica', 150, 110);

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