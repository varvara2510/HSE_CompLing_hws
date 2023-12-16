CREATE TABLE guests (
    guest_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(255),
    telephone VARCHAR(15),
    country VARCHAR(50)
);

INSERT INTO guests (first_name, last_name, email, telephone, country)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '+123456789', 'USA'),
    ('Alice', 'Smith', 'alice.smith@example.com', '+987654321', 'UK'),
    ('Bob', 'Johnson', 'bob.johnson@example.com', '+112233445', 'Canada'),
    ('Eva', 'Brown', 'eva.brown@example.com', '+998877665', 'Germany'),
    ('Michael', 'Wang', 'michael.wang@example.com', '+665544332', 'China'),
    ('Sam', 'Clafin', 'sam.claflin@gmail.com', '+123456780', 'UK');


CREATE TABLE rooms (
    room_number INT PRIMARY KEY,
    room_type VARCHAR(50),
    price_per_night DECIMAL(10, 2),
    is_occupied BOOLEAN
);

INSERT INTO rooms (room_number, room_type, price_per_night, is_occupied)
VALUES
    (101, 'standard', 100.00, FALSE),
    (102, 'deluxe', 150.00, FALSE),
    (103, 'suite', 200.00, TRUE),
    (104, 'standard', 100.00, FALSE),
    (105, 'deluxe', 150.00, FALSE);


CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    guest_id INT,
    room_number INT,
    check_in_date DATE,
    check_out_date DATE,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_number) REFERENCES rooms(room_number)
);

INSERT INTO bookings (guest_id, room_number, check_in_date, check_out_date)
VALUES
    (1, 101, '2023-01-01', '2023-01-07'),
    (2, 102, '2023-02-15', '2023-02-20'),
    (3, 103, '2023-03-10', '2023-03-15'),
    (4, 104, '2023-04-05', '2023-04-10'),
    (5, 105, '2023-05-20', '2023-05-25');


CREATE TABLE services (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    service_name VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO services (service_name, price)
VALUES
    ('breakfast', 15.00),
    ('airport Shuttle', 25.00),
    ('room Cleaning', 20.00),
    ('Wi-Fi Access', 10.00);


CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    position VARCHAR(50)
);

INSERT INTO employees (first_name, last_name, position)
VALUES
    ('Julia', 'Smith', 'Receptionist'),
    ('Mark', 'Johnson', 'Housekeeper'),
    ('Andrew', 'Miller', 'Concierge'),
    ('Emily', 'Jones', 'Manager');


CREATE TABLE services_booking (
    service_booking_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    service_id INT,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);
INSERT INTO services_booking (booking_id, service_id)
VALUES
    (1, 1), -- Завтрак для бронирования 1
    (1, 3), -- Уборка номера для бронирования 1
    (2, 2), -- Трансфер из аэропорта для бронирования 2
    (3, 1), -- Завтрак для бронирования 3
    (3, 2), -- Трансфер из аэропорта для бронирования 3
    (3, 4), -- Wi-Fi для бронирования 3
    (4, 3), -- Уборка номера для бронирования 4
    (5, 1), -- Завтрак для бронирования 5
    (5, 4); -- Wi-Fi для бронирования 5


-- Процедура, которая принимает имя и фамилию гостя, а затем возвращает время начала и конца его бронирования
DELIMITER //

CREATE PROCEDURE GetBookingInfo(
    IN guest_first_name VARCHAR(50),
    IN guest_last_name VARCHAR(50)
)
BEGIN
    SELECT 
        b.check_in_date AS start_date,
        b.check_out_date AS end_date
    FROM 
        guests g
    JOIN 
        bookings b ON g.guest_id = b.guest_id
    WHERE 
        g.first_name = guest_first_name AND g.last_name = guest_last_name;
END //

DELIMITER ;


-- Хранимая процедура для подсчета общей суммы затрат на дополнительные услуги для определенного гостя
DELIMITER //

CREATE PROCEDURE CalculateTotalServiceCost(
    IN guest_id_param INT,
    OUT total_cost DECIMAL(10, 2)
)
BEGIN
    SELECT SUM(s.price) INTO total_cost
    FROM services_booking sb
    JOIN services s ON sb.service_id = s.service_id
    WHERE sb.booking_id IN (
        SELECT booking_id
        FROM bookings
        WHERE guest_id = guest_id_param
    );
END //

DELIMITER ;
