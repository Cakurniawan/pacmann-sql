-- Creating Library Table
CREATE TABLE library (
    library_id SERIAL PRIMARY KEY,
    libraryibrary_name VARCHAR NOT NULL,
    location VARCHAR NOT NULL
);

-- Creating Book Table
CREATE TABLE book (
    book_id SERIAL PRIMARY KEY,
    library_id SERIAL REFERENCES library(library_id),
    title VARCHAR NOT NULL,
    author VARCHAR NOT NULL,
    quantity_available INT NOT NULL CHECK(quantity_available >= 0),
    category VARCHAR NOT NULL
);

-- Creating User Table
CREATE TABLE user (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    email VARCHAR NOT NULL
);

-- Creating Transaction Table
CREATE TABLE transaction (
    transaction_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES user(user_id),
    book_id INT REFERENCES book(book_id),
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE
);

-- Creating hold_queue Table
CREATE TABLE hold_queue (
    hold_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES user(user_id),
    book_id INT REFERENCES book(book_id),
    hold_date DATE NOT NULL
);
