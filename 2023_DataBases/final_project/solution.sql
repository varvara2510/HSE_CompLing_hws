-- Фильтрация

SELECT * FROM rooms WHERE is_occupied = FALSE;
SELECT * FROM guests WHERE telephone LIKE '123%';


-- Подсчет количества бронирований по странам: из какой страны больше всего посетителей

SELECT country, COUNT(*) AS total_bookings
FROM guests
GROUP BY country;

-- Подсчет общей стоимости услуг для каждого бронирования

SELECT b.booking_id, COALESCE(SUM(s.price), 0) AS total_services_cost
FROM bookings b
LEFT JOIN services_booking sb ON b.booking_id = sb.booking_id
LEFT JOIN services s ON sb.service_id = s.service_id
GROUP BY b.booking_id;


-- Вложенный запрос: например, хотим получить имена и страны гостей, которые забронировали номер в определенный временной промежуток

SELECT first_name, country
FROM guests
WHERE guest_id IN (
    SELECT guest_id
    FROM bookings
    WHERE check_in_date BETWEEN '2023-02-01' AND '2023-03-01'
);


-- Найдем среднюю стоимость бронирования для каждой страны гостей в определенный временной промежуток

SELECT g.country, AVG(r.price_per_night) AS average_booking_cost
FROM guests g
JOIN bookings b ON g.guest_id = b.guest_id
JOIN rooms r ON b.room_number = r.room_number
WHERE b.check_in_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY g.country;


-- Вызов процедуры для получения дат брони гостя

CALL GetBookingInfo('John', 'Doe');


-- Транзакция, добавляющая информацию о номере, госте и бронировании с возможностью отката при каких-либо неполадках

-- Добавление номера

INSERT INTO rooms (room_number, room_type, price_per_night, is_occupied)
VALUES (106, 'Standard', 120.00, FALSE);
START TRANSACTION;

-- Добавление гостя

INSERT INTO guests (first_name, last_name, email, telephone, country)
VALUES ('John', 'Smith', 'john.smith@example.com', '123456789', 'USA');

-- Бронирование номера для клиента

INSERT INTO bookings (guest_id, room_number, check_in_date, check_out_date)
VALUES (LAST_INSERT_ID(), 106, '2023-06-01', '2023-06-07');

-- Коммит транзакции, если все операции успешны

COMMIT;

-- Откат транзакции, если хотя бы одна операция не удалась

ROLLBACK;


-- Вызов процедуры для получения доп затрат гостя

CALL CalculateTotalServiceCost(1, @total_cost);
SELECT @total_cost AS total_service_cost;
