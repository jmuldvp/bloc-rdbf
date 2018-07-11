/*
  Find a guest who exists in the database and has not booked a room.
*/
SELECT
  hg.first_name
  ,hg.last_name
FROM
  hotel_guests hg
  LEFT JOIN hotel_booking hb ON hg.id = hb.guest_id
WHERE
  hb.guest_id IS NULL

/*
  Find bookings for a guest who has booked two rooms for the same dates.
*/
SELECT
  hg.first_name
  ,hg.last_name
  ,hb.check_in
FROM
  hotel_guests hg
  INNER JOIN hotel_booking hb ON hg.id = hb.guest_id
  ,(
    SELECT *
    FROM hotel_booking
  ) hb1
WHERE
  (hb1.booking_id = hb.booking_id
  AND hb1.check_in = hb.check_in
  AND hb1.room_id = hb.room_id)
HAVING
  Count(hb.room_id) > 1
GROUP BY
  hg.first_name
  ,hg.last_name
  ,hb.check_in

/*
  Find bookings for a guest who has booked one room several times on different dates.
*/
SELECT
  hg.first_name
  ,hg.last_name
FROM
  hotel_guests hg
  INNER JOIN hotel_booking hb ON hg.id = hb.guest_id
  ,(
    SELECT *
    FROM hotel_booking
  ) hb1
WHERE
  (hb.guest_id = hb1.guest_id
  AND hb.check_in <> hb1.check_in)
HAVING
  COUNT(hb.room_id) > 1
GROUP BY
  hg.first_name
  ,hg.last_name

/*
  Count the number of unique guests who have booked the same room.
*/
SELECT DISTINCT
  COUNT(hg.id)
  ,hb.room_id
FROM
  hotel_guests hg
  INNER JOIN hotel_booking hb ON hg.id = hb.guest_id
HAVING
  COUNT(hb.room_id) > 1
GROUP BY
  hg.id
  ,hb.room_id
