CREATE OR REPLACE FUNCTION generar_correo_estudiante(student_id NUMBER)
RETURN VARCHAR2
IS
    v_nombre estudiantes.nombre%TYPE;
    v_apellido estudiantes.apellido%TYPE;
    v_correo VARCHAR2(100);
BEGIN
    SELECT LOWER (nombre), LOWER (apellido) INTO v_nombre, v_apellido
    FROM estudiantes
    WHERE id = student_id;
    
   v_correo := SUBSTR(v_nombre, 1, 2) || '.' || SUBSTR(v_apellido, 1, 2) || '-' || TO_CHAR(SYSDATE, 'YYYY') || student_id || '@colegio.com';
    
    RETURN v_correo;
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'no existe el estudiante';
END generar_correo_estudiante;

SELECT generar_correo_estudiante(2 )FROM DUAL;
