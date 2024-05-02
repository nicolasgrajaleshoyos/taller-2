SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE matricular_estudiante(
  var_id_estudiante estudiantes.id%TYPE,
  var_id_curso  cursos.ncurso%TYPE,
  var_grado matriculas.grado%TYPE
)
AS
  v_count NUMBER;
  v_departamento cursos.departamento%TYPE;
BEGIN
  SELECT COUNT(*) INTO v_count FROM estudiantes WHERE id = var_id_estudiante;
  IF v_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('El estudiante con el ID ' || var_id_estudiante || ' no existe.');
    RETURN;
  END IF;
  
  SELECT COUNT(*) INTO v_count FROM cursos WHERE ncurso = var_id_curso;
  IF v_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('El curso con el ID ' || var_id_curso || ' no existe.');
    RETURN;
  END IF;
  
  SELECT departamento INTO v_departamento FROM cursos WHERE ncurso = var_id_curso AND rownum = 1;
  
  SELECT COUNT(*) INTO v_count FROM matriculas WHERE idestudiante = var_id_estudiante AND ncurso = var_id_curso; 
  IF v_count > 0 THEN
    DBMS_OUTPUT.PUT_LINE('El estudiante ya está matriculado en el curso.');
    RETURN;
  END IF;
  
  INSERT INTO matriculas (idestudiante, departamento, ncurso, grado) 
  VALUES (var_id_estudiante, v_departamento, var_id_curso, var_grado);
  
  DBMS_OUTPUT.PUT_LINE('El estudiante con el ID ' || var_id_estudiante || ' ha sido matriculado en el curso con el ID ' || var_id_curso || ' con el grado ' || var_grado || '.');
END matricular_estudiante;

EXECUTE matricular_estudiante(1,101,'C');

select * from matriculas;