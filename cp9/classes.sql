CREATE TABLE classes (
  class_id      int
  ,title        nvarchar(100)
  ,professor_id int
);

INSERT INTO classes (class_id, title, professor_id)
  VALUES
  (150, 'Biology 101', 20)
  ,(160, 'Calculus I', 17)
  ,(161, 'Calculus II', 15)
  ,(170, 'Physics 101', 27)
  ,(172, 'Physics 101 lab', 27)
  ,(200, 'Chemistry 101', 3)
  ,(210, 'English 101', 11)
  ,(220, 'Intro to Bottany', 21);
