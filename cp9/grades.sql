CREATE TABLE grades (
  grade_id        int
  ,student_id      int
  ,class_id       int
  ,grade          nvarchar(2)
  ,semester_id    int
);

INSERT INTO classes (grade_id, student_id, class_id, grade, semester_id)
  VALUES
  (201, 1, 160, 'B', 4)
  ,(202, 1, 161, 'A', 4)
  ,(203, 2, 170, 'A', 4)
  ,(204, 2, 172, 'C', 5)
  ,(205, 2, 160, 'B', 5)
  ,(206, 3, 150, 'A', 4)
  ,(207, 3, 170, 'D', 4)
  ,(208, 4, 150, 'B', 4)
  ,(209, 4, 220, 'C', 5)
  ,(210, 5, 160, 'A', 4)
  ,(300, 5, 161, 'B', 4)
  ,(345, 5, 170, 'B', 4)
  ,(400, 5, 172, 'C', 5)
  ,(490, 5, 200, 'A', 5);
