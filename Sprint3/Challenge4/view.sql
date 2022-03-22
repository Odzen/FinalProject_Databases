
--opcion 1:
CREATE VIEW attendance_record AS
SELECT us.first_name, us.last_name, st.id_student, att.date, 
        ts.name, qs.qt_description, op.description, op.correct
FROM "user" us INNER JOIN student st 
    ON us.id_user = st.id_user

    INNER JOIN attendance att
    ON st.id_student = att.id_student

    INNER JOIN test ts
    ON att.id_test = ts.id_test

    INNER JOIN question_test qst
    ON ts.id_test = qst.id_test
    
    INNER JOIN question qs
    ON qst.id_question = qs.id_question
    
    INNER JOIN option op
    ON qs.id_question = op.id_question;

--ver resultados de la consulta.
SELECT * FROM attendance_record;

--se cambia el nombre de la columna description a qt_description en
--en la tabla question para evitar errores en la creacion de la vista.
ALTER TABLE question rename column DESCRIPTION TO qt_description;