CREATE TABLE hotel_booking (
  booking_id    integer
  ,check_in     date
  ,check_out    date
  ,guest_id     integer
  ,room_id      integer
);

INSERT INTO hotel_booking (booking_id, check_in, check_out, guest_id, room_id)
  VALUES
  (908, '2018-08-31', '2018-09-02', 2, 5)
  (909, '2018-08-15', '2018-08-16', 4, 9)
  (910, '2018-08-31', '2018-09-02', 2, 6)
  (911, '2018-08-02', '2018-08-05', 3, 3)
  (912, '2018-09-01', '2018-09-02', 3, 5)
  (1009, '2018-09-15', '2018-09-18', 4, 9)
  (1208, '2018-12-10', '2018-12-20', 4, 9)
  (1415, '2019-01-13', '2019-01-16', 5, 1);
