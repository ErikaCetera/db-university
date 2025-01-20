-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT COUNT(*) 
FROM `students` 
WHERE YEAR(`date_of_birth`) = 1990

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT COUNT(*)
FROM `courses` 
WHERE `cfu`> 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni 
 SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) <= 1994
ORDER BY  `date_of_birth`;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT COUNT(*)
FROM `courses`
WHERE `year` = 1
AND `period` = "I semestre";

--5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT COUNT(*)
FROM `exams`
WHERE `date` = "2020-06-20"
AND HOUR (`hour`) >= 14;

--6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT COUNT(*)
FROM `degrees`
WHERE `level` = "magistrale";

--7. Daquanti dipartimenti è composta l'università? (12)
SELECT COUNT(*)
FROM `departments`;

--8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(*)
FROM `teachers`
WHERE `phone` IS NULL;



--BONUS

--1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*), YEAR(`enrolment_date`)
FROM `students`
GROUP BY YEAR(`enrolment_date`);

--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*), `office_address`
FROM `teachers`
GROUP BY `office_address`;

--3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`) , `exam_id`
FROM `exam_student`
GROUP BY `exam_id`
ORDER BY `exam_id`;

--4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT  COUNT(*), `department_id`
FROM `degrees`
GROUP BY `department_id`;

