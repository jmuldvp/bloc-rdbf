CREATE TABLE hotel_guests (
  id            integer
  ,first_name   nvarchar(20)
  ,last_name    nvarchar(30)
  ,phone_area   integer
  ,phone_pre    integer
  ,phone_suffix nvarchar(4)
  ,email        nvarchar(100)
  ,address1     nvarchar(30)
  ,address2     nvarchar(30)
  ,city         nvarchar(30)
  ,state        nvarchar(2)
  ,zip          nvarchar(5)
);

INSERT INTO hotel_guests (id, first_name, last_name, phone_area, phone_pre, phone_suffix, email, address1, address2, city, state, zip)
  VALUES
  (1, 'Jack', 'Thompson', 303, 355, '0333', 'jthomp@abc.com', '123 Main', '', 'Denver', 'CO', '80017')
  ,(2, 'Jane', 'Smith', 209, 897, '9678', 'jsmith@def.com', '15 State St', 'Ste 105', 'Sacramento', 'CA', '97886')
  ,(3, 'Tad', 'Andersen', 201, 555, '1212', 'tandy@xyz.com', '1500 Park Ave', 'Ste 807', 'New York', 'NY', '05884')
  ,(4, 'Lisa', 'Montoya', 201, 367, '3629', 'lmont@fake.com', '2906 California St', '', 'Hoboken', 'NJ', '0972')
  ,(5, 'Kim', 'West', 559, 431, '1234', 'kwest@email.com', '488 Florida Cir', '', 'Visalia', 'CA', '92189');
