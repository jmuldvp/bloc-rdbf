CREATE TABLE students (
  student_id    int
  ,first_name   nvarchar(20)
  ,last_name    nvarchar(30)
  ,email        nvarchar(100)
);

INSERT INTO students (student_id, first_name, last_name, email)
  VALUES
  (1, 'Albert', 'Einstein', 'smarty@abc.edu')
  ,(2, 'Michio', 'Kaku', 'thefuture@abc.edu')
  ,(3, 'Marie', 'Curie', 'radiation@abc.edu')
  ,(4, 'Robert', 'Hooke', 'thecell@abc.edu')
  ,(5, 'Ada', 'Lovelace', 'computethis@abc.edu');
