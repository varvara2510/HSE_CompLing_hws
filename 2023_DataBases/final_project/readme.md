# Final project "Hotel Database"

This project presents a database schema for a hotel, as well as a set of SQL queries related to managing information about guests, bookings, rooms and room services.

## Schema

![Database schema in entity-relation notation and Chen notation](./hotel_db_schema.jpg)

## CRUD 
### Create
##### Adding a guest

```sql
INSERT INTO guests (first_name, last_name, email, telephone, country)
VALUES ('Sam', 'Clafin', 'sam.claflin@gmail.com', '+1234567890', 'UK');

##### Adding a room

```sql
INSERT INTO rooms (room_number, room_type, price_per_night, is_occupied)
VALUES (106, 'Standard', 120.00, FALSE);

##### Adding a booking

```sql
INSERT INTO bookings (guest_id, room_number, check_in_date, check_out_date)
VALUES (6, 106, '2023-06-01', '2023-06-07');

### Read

```sql
SELECT * FROM guests;
SELECT * FROM rooms;
SELECT * FROM bookings;

### Update

```sql
UPDATE guests
SET email = 'updated.email@example.com'
WHERE guest_id = 1;

### Delete

```sql
DELETE FROM bookings
WHERE guest_id = 4;
