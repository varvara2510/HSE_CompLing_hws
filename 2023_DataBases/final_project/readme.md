# Final project "Hotel Database"

This project presents a database schema for a hotel, as well as a set of SQL queries related to managing information about guests, bookings, rooms and room services.

## Schema

![Database schema in entity-relation notation and Chen notation](./images/hotel-schema.png)

## CRUD (Create, Read, Update, Delete)

#### Create

##### Добавление гостя

```sql
INSERT INTO guests (first_name, last_name, email, telephone, country)
VALUES ('Sam', 'Clafin', 'sam.claflin@gmail.com', '+1234567890', 'UK');
