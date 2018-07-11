CREATE TABLE hotel_rooms (
  room_id          integer
  ,room_num   integer
  ,floor_num  integer
  ,price      numeric (5, 2)
);

INSERT INTO hotel_rooms (room_id, room_num, floor_num, price)
  VALUES
  (1, 101, 1, 49.99)
  ,(2, 102, 1, 49.99)
  ,(3, 103, 1, 59.99)
  ,(4, 104, 1, 59.99)
  ,(5, 105, 1, 59.99)
  ,(6, 201, 2, 79.99)
  ,(7, 202, 2, 79.99)
  ,(8, 203, 2, 99.99)
  ,(9, 204, 2, 99.99)
  ,(10, 205, 2, 99.99);
