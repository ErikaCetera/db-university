--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.*, `degrees`.`name` AS `degree_name`
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";


--2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT `degrees`. * , `departments`.`name` AS `department_name`
FROM `degrees`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`. `name` = "Dipartimento di Neuroscienze"
AND `degrees`.`level` = "magistrale";

--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `teachers`.*, `courses`.`name` AS `course_name`
FROM `courses`
INNER JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
ON `course_teacher`. `teacher_id` = `teachers`.`id`
WHERE `teachers`.`id` = 44;

--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`name`, `students`.`surname`, `degrees`.`name` AS `degrees_name`,  `departments`.`name` AS `department_name`
FROM `students`
INNER JOIN  `degrees`
ON `students`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `students`.`surname`, `students`.`name` ASC;

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.*, `courses`.`name` AS `course_name`, `teachers`.`name` AS `teacher_name`
FROM `degrees`
INNER JOIN `courses`
ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
ORDER BY `degrees`.`name`;

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.*, `departments`.`name` AS `department_name`
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = "Dipartimento di Matematica"
ORDER BY `teachers`.`surname`, `teachers`.`name`;


--7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
SELECT 
 `students`.`id` AS `student_id`,
 `students`.`surname` AS `student_surname`, 
 `students`.`name` AS `student_name`,
 `courses`.`id` AS `course_id`,
 COUNT(`exam_student`.`vote`) AS `tentativi`,
 MAX(`exam_student`.`vote`) AS `max_vote`
FROM`students`
INNER JOIN `exam_student` 
ON `students`.`id` = `exam_student`.`student_id`
INNER JOIN `exams` 
ON `exams`.`id` = `exam_student`.`exam_id`
INNER JOIN `courses` 
ON `courses`.`id` = `exams`.`course_id`
GROUP BY `students`.`id`, `courses`.`id`
HAVING `max_vote` >= 18
ORDER BY `students`.`surname`, `students`.`name`;
