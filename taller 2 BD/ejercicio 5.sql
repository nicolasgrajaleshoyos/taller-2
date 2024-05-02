CREATE OR REPLACE PROCEDURE aumentar_creditos_deportes
AS
BEGIN
    UPDATE estudiantes
    SET creditos = creditos + 2
    WHERE especialidad = 'Deportes';
    
END aumentar_creditos_deportes;

EXECUTE aumentar_creditos_deportes;


