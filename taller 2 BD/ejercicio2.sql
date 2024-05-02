CREATE OR REPLACE PROCEDURE 
actualizarEspecialidad
AS
BEGIN
DELETE FROM especialidades;
FOR i in (SELECT especialidad as especialidad, SUM(creditos) as creditos, COUNT(*) as student FROM estudiantes GROUP BY especialidad)LOOP
    Insert into especialidades values(i.especialidad, i.creditos, i.student);
    END LOOP;
    commit;
END;
EXECUTE actualizarEspecialidad()

select * from especialidades;
