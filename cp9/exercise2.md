Questions asked in the checkpoint to help design a database.

> 1. What classes/entites do we need to model?
> 2. What fields/attributes will each entity need?
> 3. What data types do we need to use?
> 4. What relationships exist between entities?
> 5. How should those relationships be represented in tables?


Exercise 2
>Design a data model for students and the classes they have taken. The model should include the students' grades for a given class.

> - Work through the questions from the example above.

1. I think poorly designed system would try and put this data in two tables.  I think a better designed db would at the very least use 3 tables for the purposes of this example and exercise.  For the purposes of this exercise, I think there needs to be *students*, *classes* and *grades* tables.<br />
2. Just to keep it simple for this exercise, the _students_ table would get the following columns... student_id, first_name, last_name and email. The _classes_ table would get class_id, title, instructor_id.  The _grades_ table would get student_id, class_id, grade and maybe semester_id columns.<br />
3. _students_ : student_id -> int, first_name -> varchar(20), last_name -> varchar(30), email -> varchar(100). <br />
_classes_ : class_id -> int, title -> varchar(100), instructor_id -> int.<br />
_grades_ : grade_id -> int, student_id -> int, class_id -> int, grade -> varchar(2), semester_id -> int<br />
4. _students.student_id_ = _grades.student_id_; _classes.class_id_ = _grades.class_id_ <br />
5. 1 to many from the _students_ table to the _grades_ table and 1 to many from the _classes_ table to the _grades_ table.

> - Document any assumptions you make about what data should be stored, what data types should be used, etc., and include them in a text file.

I am trying to keep this simple just to show that I know how to work and setup relationships otherwise, I may have added an address table, possibly a zip code table, phone number table and instead of a student table, I could've made a person table then indicated if they were a student an employee or maybe even a contact for someone in the company table that the school does business with for payroll purposes. That way, you have all names inside a name table instead of having names in a professor table and student names in a student table etc.  I think having all names in a names table may even help with issuing access to the system for students to look up their grades or professors to look up their attendance rolls and so on. Depending on how everything else is designed, this may even help by simplifying the process of a scenario where a professor may want to take a class and become a student as well.

I indicated data types in my third answer above.

> Ask questions of your mentor in your next session if you are unsure about parts of your model.

I don't have any questions about this but I'll be sure to ask my mentor if any questions come up.

> Draw the model using the notation used in the checkpoint and submit a picture. You can also use a tool like StarUML or quickdatabasediagrams.com if you choose.

I took a screenshot and put the screenshot in this checkpoint.  Please reference education.png within my Github submission.
