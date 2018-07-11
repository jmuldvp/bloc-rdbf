/*
  All students who have taken a particular class.
*/
SELECT
  s.first_name
  ,s.last_name
  ,c.title
FROM
  students s
  INNER JOIN grades g ON  s.student_id = g.student_id
  INNER JOIN classes c ON g.class_id = c.class_id
WHERE
  c.title = 'Calculus I'

/*
  The number of each grade (using letter grades A-F) earned in a particular class.
*/
SELECT
  Count(g.grade_id)
  ,g.grade
FROM
  grades g
  INNER JOIN classes c ON g.class_id = c.class_id
WHERE
  c.title = 'Physics 101'
GROUP BY
  g.grade

/*
  Class names and the total number of students who have taken each class in the list.
*/
SELECT
  c.title
  ,COUNT(g.student_id)
FROM
  grades g
  INNER JOIN classes c ON g.class_id = c.class_id
GROUP BY
  c.title

/*
  The class taken by the largest number of students.
*/
SELECT
  c.title
  MAX( COUNT(g.class_id))
FROM
  grades g
  INNER JOIN classes c ON g.class_id = c.class_id
GROUP BY
  c.title
