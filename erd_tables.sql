-- Creating Library Table
CREATE TABLE library (
    library_id SERIAL NOT NULL,
    ibrary_name VARCHAR NOT NULL,
    location_provider VARCHAR NOT NULL,
    provider VARCHAR NOT NULL,
    PRIMARY KEY (library_id)
);

-- DROP TABLE library;

-- Creating Book Table
CREATE TABLE book (
    book_id INT NOT NULL,
    library_id INT NOT NULL,
    title VARCHAR NOT NULL,
    author VARCHAR NOT NULL,
    quantity_available INT NOT NULL CHECK(quantity_available >= 0),
    category VARCHAR NOT NULL,
    PRIMARY KEY (book_id),
    CONSTRAINT fk_library_id
        FOREIGN KEY(library_id)
        REFERENCES library(library_id)
);

-- DROP TABLE book;

-- Creating User Table
CREATE TABLE users (
    user_id SERIAL NOT NULL,
    username VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    PRIMARY KEY (user_id)
);

-- DROP TABLE users;

-- Creating Transaction Table
CREATE TABLE transactions (
    transaction_id int NOT NULL,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    PRIMARY KEY (transaction_id),
    CONSTRAINT fk_userr_id
        FOREIGN KEY(user_id)
        REFERENCES users(user_id),
    CONSTRAINT fk_bookk_id
        FOREIGN KEY (book_id)
        REFERENCES book(book_id)
);

-- DROP TABLE transactions;

-- Creating reservations Table
CREATE TABLE reservations (
    reservation_id int NOT NULL,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    queue_position INT NOT NULL,
    reservation_date DATE NOT NULL,
    PRIMARY KEY (reservation_id),
    CONSTRAINT fk_userrr_id
        FOREIGN KEY (user_id)
        REFERENCES users(user_id),
    CONSTRAINT fk_bookkk_id
        FOREIGN KEY (book_id)
        REFERENCES book(book_id)
);

-- DROP TABLE reservations

-- After we generate dummy data with Faker python
-- we import the data to the database table
-- Library Table

COPY
    library(
        library_id,
        ibrary_name,
        location_provider,
        provider
    )
FROM
    '/tmp/table_library_csv.csv'
DELIMITER ','
CSV
HEADER

-- After we generate dummy data with Faker python
-- we import the data to the database table
-- Book Table

COPY
    book(
        book_id,
        library_id,
        title,
        author,
        quantity_available,
        category
    )
FROM
    '/tmp/table_book_csv.csv'
DELIMITER ','
CSV
HEADER


-- After we generate dummy data with Faker python
-- we import the data to the database table
-- Users Table

COPY
    users(
        user_id,
        username,
        password,
        email
    )
FROM
    '/tmp/table_user_csv.csv'
DELIMITER ','
CSV
HEADER


-- After we generate dummy data with Faker python
-- we import the data to the database table
-- Transactions Table

COPY
    transactions(
        transaction_id,
        user_id,
        book_id,
        loan_date,
        due_date,
        return_date
    )
FROM
    '/tmp/table_transaction_csv.csv'
DELIMITER ','
CSV
HEADER

-- After we generate dummy data with Faker python
-- we import the data to the database table
-- Reservations Table

COPY
    reservations(
        reservation_id,
        user_id,
        book_id,
        queue_position,
        reservation_date
    )
FROM
    '/tmp/table_reservation_csv.csv'
DELIMITER ','
CSV
HEADER