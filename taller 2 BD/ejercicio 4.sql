SET SERVEROUTPUT ON;
DECLARE
  v_id_es_menor estudiantes.id%TYPE;
  v_id_es_mayor estudiantes.id%TYPE;
BEGIN
  SELECT MAX(id),MIN(id) INTO v_id_es_menor,v_id_es_mayor from estudiantes;
  DBMS_OUTPUT.PUT_LINE('Estudiante con el ID menor: ' || v_id_es_menor );
  DBMS_OUTPUT.PUT_LINE('Estudiante con el ID mayor: ' || v_id_es_mayor );
END;